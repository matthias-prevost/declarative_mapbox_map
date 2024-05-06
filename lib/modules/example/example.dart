import 'package:declarative_mapbox_map/modules/declarative_map/declarative_map.dart';
import 'package:declarative_mapbox_map/modules/declarative_map/models/i_circle_annotation_options_with_id.dart';
import 'package:declarative_mapbox_map/modules/example/utils/map_utils.dart';
import 'package:declarative_mapbox_map/modules/shared/widgets/floating_add_button.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';

class ExampleMap extends StatefulWidget {
  const ExampleMap({super.key});

  @override
  State<ExampleMap> createState() => _ExampleMapState();
}

class _ExampleMapState extends State<ExampleMap> {
  final randomBlueAndRedPoints = getRandomBlueAndRedPoints(20);
  late IList<ICircleAnnotationOptionsWithId> annotationOptionsList;

  @override
  void initState() {
    super.initState();

    annotationOptionsList = randomBlueAndRedPoints;
  }

  void filterColor(int color) {
    setState(() {
      annotationOptionsList = randomBlueAndRedPoints
          .where((element) => element.options.circleColor == color)
          .toIList();
    });
  }

  void filterBlueDots() {
    filterColor(Colors.blue.value);
  }

  void filterRedDots() {
    filterColor(Colors.red.value);
  }

  void clearFilters() {
    setState(() {
      annotationOptionsList = randomBlueAndRedPoints;
    });
  }

  void onTurnAllInGreen() {
    setState(() {
      annotationOptionsList = turnAllInGreen(annotationOptionsList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DeclarativeMap(
          annotationOptionsList: annotationOptionsList,
        ),
        FloatingAddButton(
          onFilterBlue: filterBlueDots,
          onFilterRed: filterRedDots,
          onClearFilters: clearFilters,
          onTurnGreen: onTurnAllInGreen,
        ),
      ],
    );
  }
}
