import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

part 'i_circle_annotation_options_with_id.freezed.dart';

@freezed
class ICircleAnnotationOptionsWithId with _$ICircleAnnotationOptionsWithId {
  const factory ICircleAnnotationOptionsWithId({
    required int id,
    required CircleAnnotationOptions options,
  }) = _ICircleAnnotationOptionsWithId;
}
