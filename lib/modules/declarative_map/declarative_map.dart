import 'package:declarative_mapbox_map/modules/shared/utils/map_utils.dart';
import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class DeclarativeMap extends StatefulWidget {
  const DeclarativeMap({super.key, required this.annotationOptionsList});

  final List<CircleAnnotationOptions> annotationOptionsList;

  @override
  State<DeclarativeMap> createState() => _DeclarativeMapState();
}

class _DeclarativeMapState extends State<DeclarativeMap> {
  CircleAnnotationManager? circleAnnotationManager;

  @override
  void didUpdateWidget(covariant DeclarativeMap oldWidget) {
    super.didUpdateWidget(oldWidget);

    final circleAnnotationManager = this.circleAnnotationManager;

    if(circleAnnotationManager == null) {
      return;
    }

    circleAnnotationManager.deleteAll();
    circleAnnotationManager.createMulti(widget.annotationOptionsList);
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

        await annotationManger.createMulti(widget.annotationOptionsList);
      },
    );
  }
}
