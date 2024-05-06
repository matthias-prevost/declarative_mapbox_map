import 'package:declarative_mapbox_map/modules/declarative_map/models/i_circle_annotation.dart';
import 'package:declarative_mapbox_map/modules/declarative_map/models/i_circle_annotation_options_with_id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'i_circle_annotation_linker.freezed.dart';

@freezed
class ICircleAnnotationLinker with _$ICircleAnnotationLinker {
  const factory ICircleAnnotationLinker({
    required ICircleAnnotationOptionsWithId
        circleAnnotationOptions,
    required ICircleAnnotation circleAnnotation,
  }) = _ICircleAnnotationLinker;
}
