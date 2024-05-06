import 'package:declarative_mapbox_map/modules/declarative_map/models/i_circle_annotation_options.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

part 'i_circle_annotation.freezed.dart';

@freezed
class ICircleAnnotation with _$ICircleAnnotation {
  const factory ICircleAnnotation({
    /// The id for annotation
    required String id,

    /// The geometry that determines the location/shape of this annotation
    Map<String?, Object?>? geometry,

    /// Sorts features in ascending order based on this value. Features with a higher sort key will appear above features with a lower sort key.
    double? circleSortKey,

    /// Amount to blur the circle. 1 blurs the circle such that only the centerpoint is full opacity.
    double? circleBlur,

    /// The fill color of the circle.
    int? circleColor,

    /// The opacity at which the circle will be drawn.
    double? circleOpacity,

    /// Circle radius.
    double? circleRadius,

    /// The stroke color of the circle.
    int? circleStrokeColor,

    /// The opacity of the circle's stroke.
    double? circleStrokeOpacity,

    /// The width of the circle's stroke. Strokes are placed outside of the `circle-radius`.
    double? circleStrokeWidth,
  }) = _ICircleAnnotation;

  const ICircleAnnotation._();

  factory ICircleAnnotation.fromCircleAnnotation(
    CircleAnnotation circleAnnotation,
  ) {
    return ICircleAnnotation(
      id: circleAnnotation.id,
      geometry: circleAnnotation.geometry,
      circleSortKey: circleAnnotation.circleSortKey,
      circleBlur: circleAnnotation.circleBlur,
      circleColor: circleAnnotation.circleColor,
      circleOpacity: circleAnnotation.circleOpacity,
      circleRadius: circleAnnotation.circleRadius,
      circleStrokeColor: circleAnnotation.circleStrokeColor,
      circleStrokeOpacity: circleAnnotation.circleStrokeOpacity,
      circleStrokeWidth: circleAnnotation.circleStrokeWidth,
    );
  }

  CircleAnnotation toCircleAnnotation() {
    return CircleAnnotation(
      id: id,
      geometry: geometry,
      circleSortKey: circleSortKey,
      circleBlur: circleBlur,
      circleColor: circleColor,
      circleOpacity: circleOpacity,
      circleRadius: circleRadius,
      circleStrokeColor: circleStrokeColor,
      circleStrokeOpacity: circleStrokeOpacity,
      circleStrokeWidth: circleStrokeWidth,
    );
  }

  ICircleAnnotation copyWithOptions(ICircleAnnotationOptions options) {
    return ICircleAnnotation(
      id: id,
      geometry: options.geometry,
      circleSortKey: options.circleSortKey,
      circleBlur: options.circleBlur,
      circleColor: options.circleColor,
      circleOpacity: options.circleOpacity,
      circleRadius: options.circleRadius,
      circleStrokeColor: options.circleStrokeColor,
      circleStrokeOpacity: options.circleStrokeOpacity,
      circleStrokeWidth: options.circleStrokeWidth,
    );
  }
}
