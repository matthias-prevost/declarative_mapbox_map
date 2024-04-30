import 'package:declarative_mapbox_map/modules/shared/utils/map_utils.dart';
import 'package:declarative_mapbox_map/modules/shared/widgets/floating_add_button.dart';
import 'package:declarative_mapbox_map/modules/simple_map/simple_map.dart';
import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

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
  final randomBlueAndRedPoints= getRandomBlueAndRedPoints(20);
  late List<CircleAnnotationOptions> annotationOptionsList;

  @override
  void initState() {
    super.initState();

    annotationOptionsList = randomBlueAndRedPoints;
  }

  void filterColor(int color) {
    setState(() {
      annotationOptionsList = randomBlueAndRedPoints
          .where((element) => element.circleColor == color)
          .toList();
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
        SimpleMap(
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