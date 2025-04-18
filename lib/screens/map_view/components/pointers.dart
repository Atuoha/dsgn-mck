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
      left: position['left'],
      child: PointerItem(index: index, showingIcons: showingIcons),
    );
  }).toList();
}

class PointerItem extends StatefulWidget {
  final int index;
  final bool showingIcons;

  const PointerItem(
      {super.key, required this.index, required this.showingIcons});

  @override
  State<PointerItem> createState() => _PointerItemState();
}

class _PointerItemState extends State<PointerItem> {
  bool _expanded = false;
  bool _showText = false;
  bool _displayIcons = false;
  bool _setupIcons = false;
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() async {
    await Future.delayed(
      Duration(milliseconds: widget.index * 100),
    );
    setState(() {
      _visible = true;
      _expanded = true;
    });

    await Future.delayed(const Duration(seconds: 2));
    setState(() => _showText = true);

    await Future.delayed(const Duration(seconds: 2));
    setState(() => _displayIcons = true);

    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _setupIcons = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _visible ? 1.0 : 0.0,
      duration: const Duration(seconds: 2),
      child: AnimatedContainer(
        duration: const Duration(seconds: 2),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        height: _expanded ? (widget.showingIcons && _displayIcons ? 50 : 40) : 20,
        width: _expanded ? (widget.showingIcons && _displayIcons ? 40 : 80) : 20,
        decoration: const BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            topLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        child: Center(
          child: _setupIcons
              ? const Icon(
            Iconsax.buliding_copy,
            color: Colors.white,
          )
              : AnimatedOpacity(
            opacity: _showText ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 500),
            child: Text(
              '${widget.index + 10},${widget.index + 1} mn P',
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
