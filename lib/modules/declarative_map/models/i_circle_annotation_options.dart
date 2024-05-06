import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

part 'i_circle_annotation_options.freezed.dart';

@freezed
class ICircleAnnotationOptions with _$ICircleAnnotationOptions {
  const factory ICircleAnnotationOptions({
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
  }) = _ICircleAnnotationOptions;

  const ICircleAnnotationOptions._();

  CircleAnnotationOptions toCircleAnnotationOptions() {
    return CircleAnnotationOptions(
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

  ICircleAnnotationOptions copyWithOptions(ICircleAnnotationOptions options) {
    return ICircleAnnotationOptions(
      geometry: options.geometry ?? geometry,
      circleSortKey: options.circleSortKey ?? circleSortKey,
      circleBlur: options.circleBlur ?? circleBlur,
      circleColor: options.circleColor ?? circleColor,
      circleOpacity: options.circleOpacity ?? circleOpacity,
      circleRadius: options.circleRadius ?? circleRadius,
      circleStrokeColor: options.circleStrokeColor ?? circleStrokeColor,
      circleStrokeOpacity: options.circleStrokeOpacity ?? circleStrokeOpacity,
      circleStrokeWidth: options.circleStrokeWidth ?? circleStrokeWidth,
    );
  }
}
