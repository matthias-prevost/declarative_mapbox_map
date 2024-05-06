import 'package:collection/collection.dart';
import 'package:declarative_mapbox_map/modules/declarative_map/models/i_circle_annotation.dart';
import 'package:declarative_mapbox_map/modules/declarative_map/models/i_circle_annotation_linker.dart';
import 'package:declarative_mapbox_map/modules/declarative_map/models/i_circle_annotation_options_with_id.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

AnnotationChanges getChangesInAnnotationList({
  required IList<ICircleAnnotationOptionsWithId> oldAnnotations,
  required IList<ICircleAnnotationOptionsWithId> newAnnotations,
  required IList<ICircleAnnotationLinker> oldCircleAnnotationLinkers,
}) {
  var removedAnnotations = IList<ICircleAnnotation>();
  var addedAnnotations = IList<ICircleAnnotationOptionsWithId>();

  for (final newAnnotation in newAnnotations) {
    final oldAnnotation = oldAnnotations.firstWhereOrNull(
      (oldAnnotation) => oldAnnotation.id == newAnnotation.id,
    );

    // If the annotation is not in the map, add it
    if (oldAnnotation == null) {
      addedAnnotations = addedAnnotations.add(newAnnotation);
    }
  }

  // If the annotation is not in the new list, remove it
  for (final oldCircleAnnotationLinker in oldCircleAnnotationLinkers) {
    final hasBeenRemoved = newAnnotations.none(
      (newAnnotation) =>
          newAnnotation.id ==
          oldCircleAnnotationLinker.circleAnnotationOptions.id,
    );

    if (hasBeenRemoved) {
      removedAnnotations = removedAnnotations.add(
        oldCircleAnnotationLinker.circleAnnotation,
      );
    }
  }

  return (
    addedAnnotations: addedAnnotations,
    removedAnnotations: removedAnnotations,
  );
}

typedef AnnotationChanges = ({
  IList<ICircleAnnotationOptionsWithId> addedAnnotations,
  IList<ICircleAnnotation> removedAnnotations,
});
