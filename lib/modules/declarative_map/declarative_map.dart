import 'dart:async';

import 'package:declarative_mapbox_map/modules/declarative_map/models/i_circle_annotation_linker.dart';
import 'package:declarative_mapbox_map/modules/declarative_map/models/i_circle_annotation_options_with_id.dart';
import 'package:declarative_mapbox_map/modules/declarative_map/utils/annotations.dart';
import 'package:declarative_mapbox_map/modules/declarative_map/utils/get_changes_in_annotations.dart';
import 'package:declarative_mapbox_map/modules/example/utils/map_utils.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class DeclarativeMap extends StatefulWidget {
  const DeclarativeMap({super.key, required this.annotationOptionsList});

  final IList<ICircleAnnotationOptionsWithId> annotationOptionsList;

  @override
  State<DeclarativeMap> createState() => _DeclarativeMapState();
}

class _DeclarativeMapState extends State<DeclarativeMap> {
  CircleAnnotationManager? circleAnnotationManager;
  IList<ICircleAnnotationLinker> circleAnnotationLinkers = IList();

  Future<void> setCircleAnnotations({
    required AnnotationChanges changes,
    required CircleAnnotationManager circleAnnotationManager,
  }) async {
    final updatedAnnotationLinkers = await updateAnnotations(
      circleAnnotationManager: circleAnnotationManager,
      annotationUpdates: changes.updatedAnnotations,
    );

    if (mounted) {
      setState(() {
        circleAnnotationLinkers = circleAnnotationLinkers.updateById(
          updatedAnnotationLinkers,
          (circleAnnotationLinker) =>
              circleAnnotationLinker.circleAnnotation.id,
        );
      });
    }

    await removeAnnotations(
      circleAnnotationManager: circleAnnotationManager,
      annotationsToRemove: changes.removedAnnotations,
    );

    if (mounted) {
      setState(() {
        circleAnnotationLinkers = circleAnnotationLinkers.removeWhere(
          (circleAnnotationLinker) => changes.removedAnnotations.contains(
            circleAnnotationLinker.circleAnnotation,
          ),
        );
      });
    }

    final createdCircleAnnotationLinkers = await addAnnotations(
      circleAnnotationManager: circleAnnotationManager,
      annotationsToAdd: changes.addedAnnotations,
    );

    if (mounted) {
      setState(() {
        circleAnnotationLinkers = circleAnnotationLinkers.addAll(
          createdCircleAnnotationLinkers,
        );
      });
    }
  }

  @override
  void didUpdateWidget(covariant DeclarativeMap oldWidget) {
    super.didUpdateWidget(oldWidget);

    final circleAnnotationManager = this.circleAnnotationManager;

    if (circleAnnotationManager == null) {
      return;
    }

    if (oldWidget.annotationOptionsList == widget.annotationOptionsList) {
      return;
    }

    final changes = getChangesInAnnotationList(
      oldAnnotations: oldWidget.annotationOptionsList,
      newAnnotations: widget.annotationOptionsList,
      oldCircleAnnotationLinkers: circleAnnotationLinkers,
    );

    unawaited(setCircleAnnotations(
      changes: changes,
      circleAnnotationManager: circleAnnotationManager,
    ));
  }

  @override
  Widget build(BuildContext context) {
    MapboxOptions.setAccessToken(
      const String.fromEnvironment('MAPBOX_PUBLIC_TOKEN'),
    );

    return MapWidget(
      cameraOptions: CameraOptions(zoom: 11, center: centerPoint.toJson()),
      onMapCreated: (mapController) async {
        final annotationManger =
            await mapController.annotations.createCircleAnnotationManager();

        circleAnnotationManager = annotationManger;

        final createdCircleAnnotationLinkers = await addAnnotations(
          circleAnnotationManager: annotationManger,
          annotationsToAdd: widget.annotationOptionsList,
        );

        setState(() {
          circleAnnotationLinkers = circleAnnotationLinkers.addAll(
            createdCircleAnnotationLinkers,
          );
        });
      },
    );
  }
}
