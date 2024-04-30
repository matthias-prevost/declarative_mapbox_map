import 'package:flutter/material.dart';

class FloatingAddButton extends StatelessWidget {
  const FloatingAddButton(
      {super.key,
      required this.onFilterBlue,
      required this.onFilterRed,
      required this.onClearFilters});

  final VoidCallback onFilterBlue;
  final VoidCallback onFilterRed;
  final VoidCallback onClearFilters;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 40,
      right: 20,
      child: Row(
        children: [
          FloatingActionButton(
            onPressed: onFilterBlue,
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            child: const Text('blue'),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
              onPressed: onFilterRed,
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              child: const Text('red')),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: onClearFilters,
            backgroundColor: Colors.grey[100],
            child: const Text('clear'),
          ),
        ],
      ),
    );
  }
}
