import 'dart:math';

import 'package:declarative_mapbox_map/modules/declarative_map/models/i_circle_annotation_options.dart';
import 'package:declarative_mapbox_map/modules/declarative_map/models/i_circle_annotation_options_with_id.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

// Coordinates for the city of Paris
final centerPoint = Point(coordinates: Position(2.3522, 48.8566));

IList<ICircleAnnotationOptionsWithId> getRandomBlueAndRedPoints(int count) {
  final points = <ICircleAnnotationOptionsWithId>[];
  for (var i = 0; i < count; i++) {
    points.add(getColoredRandomPoint(
      color: i % 2 == 0 ? Colors.blue.value : Colors.red.value,
      id: i,
    ));
  }
  return points.lock;
}

ICircleAnnotationOptionsWithId getColoredRandomPoint(
    {required int color, required int id}) {
  final point = ICircleAnnotationOptionsWithId(
      id: id,
      options: ICircleAnnotationOptions(
        circleColor: color,
        circleRadius: 10,
        geometry: getRandomPointNearCenter(),
      ));
  return point;
}

Map<String, dynamic> getRandomPointNearCenter() {
  var center = centerPoint.clone();
  final random = Random();
  return Point(
    coordinates: Position(
      center.coordinates.lng + random.nextDouble() * 0.1 - 0.05,
      center.coordinates.lat + random.nextDouble() * 0.1 - 0.05,
    ),
  ).toJson();
}
