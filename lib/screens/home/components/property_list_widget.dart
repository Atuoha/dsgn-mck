import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'property_card.dart';
import '../../../model/property.dart';

class PropertyListWidget extends StatefulWidget {
  const PropertyListWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  State<PropertyListWidget> createState() => _PropertyListWidgetState();
}

class _PropertyListWidgetState extends State<PropertyListWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    Future.delayed(const Duration(seconds: 1), () {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(
        opacity: Tween<double>(begin: 0, end: 1).animate(_controller),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: widget.size.height * 0.25,
                    child: PropertyCard(
                      property: properties[0],
                    ),
                  ),
                  SizedBox(
                    height: widget.size.height * 0.5,
                    child: Row(
                      children: [
                        Expanded(
                         child: PropertyCard(
                            property: properties[1],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              SizedBox(
                                height: (widget.size.height * 0.5) / 2,
                                child: PropertyCard(
                                  property: properties[2],
                                ),
                              ),
                              SizedBox(
                                height: (widget.size.height * 0.5) / 2,
                                child: PropertyCard(
                                  property: properties[3],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(100)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
