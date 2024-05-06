import 'package:declarative_mapbox_map/modules/declarative_map/models/i_circle_annotation.dart';
import 'package:declarative_mapbox_map/modules/declarative_map/models/i_circle_annotation_linker.dart';
import 'package:declarative_mapbox_map/modules/declarative_map/models/i_circle_annotation_options_with_id.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

/// Adds the circle annotations to the map
///
/// Returns a list of [ICircleAnnotationLinker] containing the added
/// [ICircleAnnotation]
Future<IList<ICircleAnnotationLinker>> addAnnotations({
  required CircleAnnotationManager circleAnnotationManager,
  required IList<ICircleAnnotationOptionsWithId> annotationsToAdd,
}) {
  final futureAddedCircleAnnotationLinkers =
      annotationsToAdd.map((annotationOptions) async {
    final createdAnnotation = await circleAnnotationManager.create(
      annotationOptions.options.toCircleAnnotationOptions(),
    );

    return ICircleAnnotationLinker(
      circleAnnotation:
          ICircleAnnotation.fromCircleAnnotation(createdAnnotation),
      circleAnnotationOptions: annotationOptions,
    );
  }).toIList();

  return futureAddedCircleAnnotationLinkers.wait.then(IList.new);
}

/// Removes the given circle annotations from the map
Future<void> removeAnnotations({
  required CircleAnnotationManager circleAnnotationManager,
  required IList<ICircleAnnotation> annotationsToRemove,
}) async {
  await Future.forEach(annotationsToRemove, (annotation) async {
    await circleAnnotationManager.delete(annotation.toCircleAnnotation());
  });
}
