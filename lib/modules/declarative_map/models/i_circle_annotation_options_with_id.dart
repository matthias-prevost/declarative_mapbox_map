import 'package:declarative_mapbox_map/modules/declarative_map/models/i_circle_annotation_options.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'i_circle_annotation_options_with_id.freezed.dart';

@freezed
class ICircleAnnotationOptionsWithId with _$ICircleAnnotationOptionsWithId {
  const factory ICircleAnnotationOptionsWithId({
    required int id,
    required ICircleAnnotationOptions options,
  }) = _ICircleAnnotationOptionsWithId;
}
