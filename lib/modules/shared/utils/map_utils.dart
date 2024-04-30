import 'dart:math';

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

// Coordinates for the city of Paris
final centerPoint = Point(coordinates: Position(2.3522, 48.8566));

IList<CircleAnnotationOptions> getRandomBlueAndRedPoints(int count) {
  final points = <CircleAnnotationOptions>[];
  for (var i = 0; i < count; i++) {
    points.add(getColoredRandomPoint(
        i % 2 == 0 ? Colors.blue.value : Colors.red.value));
  }
  return points.lock;
}

CircleAnnotationOptions getColoredRandomPoint(int color) {
  final point = CircleAnnotationOptions(
    circleColor: color,
    circleRadius: 10,
    geometry: getRandomPointNearCenter(),
  );
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
