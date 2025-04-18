import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import '../../../constants/app_color.dart';

final List<Map<String, double>> positions = [
  {'top': 170, 'left': 100},
  {'top': 250, 'left': 200},
  {'top': 350, 'left': 120},
  {'top': 500, 'left': 180},
  {'top': 550, 'left': 230},
  {'top': 450, 'left': 10},
  {'top': 401, 'left': 250},
  {'top': 165, 'left': 240},
];

List<Widget> buildPointers({required bool showingIcons}) {
  return positions.asMap().entries.map((entry) {
    int index = entry.key;
    Map<String, double> position = entry.value;

    return Positioned(
      top: position['top'],
      left: showingIcons ? position['left']! + 10 : position['left'],
      child: AnimatedContainer(
        duration: const Duration(seconds: 2),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        height: showingIcons ? 50 : 40,
        width: showingIcons ? 40: 80,
        decoration: const BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            topLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        child: Center(
          child: showingIcons
              ? const Icon(
            Iconsax.buliding_copy,
            color: Colors.white,
          )
              : Text(
            '${index + 10},${index + 1} mn P',
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }).toList();
}