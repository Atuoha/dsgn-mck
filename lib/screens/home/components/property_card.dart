import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../constants/app_color.dart';
import '../../../model/property.dart';
import '../../map_view/map_view.dart';

class PropertyCard extends StatefulWidget {
  final Property property;

  const PropertyCard({
    super.key,
    required this.property,
  });

  @override
  State<PropertyCard> createState() => _PropertyCardState();
}

class _PropertyCardState extends State<PropertyCard> {
  double _animatedWidth = 0.0;
  double _opacity = 0.0;
  bool showText = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;

        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (_animatedWidth == 0.0) {
            setState(() {
              _animatedWidth = maxWidth * 0.15;
            });

            Future.delayed(const Duration(seconds: 2), () {
              setState(() {
                _animatedWidth = maxWidth * 0.85;
              });

              Future.delayed(const Duration(seconds: 1), () {
                setState(() {
                  _opacity = 1.0;
                  showText = true;
                });
              });
            });
          }
        });

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Stack(
                children: [
                  Image.asset(
                    widget.property.imageUrl,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      width: _animatedWidth,
                      height: 50,
                      curve: Curves.easeOut,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              color: widget.property.blurColor.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                if (showText)
                                  AnimatedOpacity(
                                    duration: const Duration(milliseconds: 500),
                                    opacity: _opacity,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 48),
                                      child: Text(
                                        widget.property.address,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: const TextStyle(
                                          color: AppColors.blackColor,
                                          fontSize: 13.5,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),

                                Positioned(
                                  right: 0,
                                  child: InkWell(
                                    onTap: () => Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => const MapViewScreen(),
                                      ),
                                    ),
                                    child: const CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 20,
                                      child: Icon(
                                        Icons.chevron_right,
                                        color: AppColors.componentColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )


                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
