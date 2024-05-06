import 'package:declarative_mapbox_map/modules/declarative_map/declarative_map.dart';
import 'package:declarative_mapbox_map/modules/declarative_map/models/i_circle_annotation_options_with_id.dart';
import 'package:declarative_mapbox_map/modules/shared/utils/map_utils.dart';
import 'package:declarative_mapbox_map/modules/shared/widgets/floating_add_button.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Declarative Mapbox Map Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrangeAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
        ),
      ],
    );
  }
}
