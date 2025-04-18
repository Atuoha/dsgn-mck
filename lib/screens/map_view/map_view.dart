import 'dart:async';
import 'package:flutter/material.dart';
import '../components/bottom_nav.dart';
import 'components/layer_widget.dart';
import 'components/map_bg.dart';
import 'components/menu_view.dart';
import 'components/pointers.dart';
import 'components/top_search.dart';
import 'components/variants_widget.dart';

class MapViewScreen extends StatefulWidget {
  const MapViewScreen({super.key});

  @override
  State<MapViewScreen> createState() => _MapViewScreenState();
}

class _MapViewScreenState extends State<MapViewScreen> {
  bool isMenuShowing = false;
  int selectedMenuIndex = 1;
  bool showingIcons = false;

  void onItemTapped(int index) {
    setState(() {
      selectedMenuIndex = index;
    });
  }

  void toggleMenu() {
    setState(() {
      isMenuShowing = !isMenuShowing;
    });
  }

  @override
  void initState() {
    super.initState();

    Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        showingIcons = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xff151515),
      body: Stack(
        children: [
          const Positioned.fill(
            child: MapBG(),
          ),
          TopSearch(size: size),
          VariantsWidget(size: size),
          ...buildPointers(showingIcons: showingIcons),
          LayerWidget(toggleMenu: toggleMenu),
          MenuView(
            isMenuShowing: isMenuShowing,
            size: size,
            selectedMenuIndex: selectedMenuIndex,
            onItemTapped: onItemTapped,
          ),
          const Positioned(
            bottom: 20,
            left: 70,
            right: 70,
            child: CustomBottomNavBar(index: 0),
          ),
        ],
      ),
    );
  }
}
