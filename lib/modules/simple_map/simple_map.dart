import 'package:declarative_mapbox_map/modules/shared/utils/map_utils.dart';
import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class SimpleMap extends StatefulWidget {
  const SimpleMap({super.key, required this.annotationOptionsList});

  final List<CircleAnnotationOptions> annotationOptionsList;

  @override
  State<SimpleMap> createState() => _SimpleMapState();
}

class _SimpleMapState extends State<SimpleMap> {
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

        await annotationManger.createMulti(widget.annotationOptionsList);
      },
    );
  }
}
