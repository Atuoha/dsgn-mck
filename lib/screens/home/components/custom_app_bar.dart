import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import '../../../constants/app_color.dart';
import '../../../gen/assets.gen.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<double> _widthAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _widthAnimation = Tween<double>(
            begin: widget.size.width * 0.1, end: widget.size.width * 0.47)
        .animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AnimatedBuilder(
            animation: _widthAnimation,
            builder: (context, child) {
              return Container(
                width: _widthAnimation.value,
                height: 46,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: FadeTransition(
                    opacity: _opacityAnimation,
                    // Dynamic opacity based on animation
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Iconsax.location,
                          color: AppColors.accentColor,
                          size: 20,
                        ),
                        if (_controller.isCompleted)
                          Text(
                            'Saint Petersburg',
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: AppColors.accentColor,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              );
            },),

          ScaleTransition(
            scale: _opacityAnimation,
            child: FadeTransition(
              opacity: _opacityAnimation,
              child: Assets.images.avatar.image(width: 50),
            ),
          ),
        ],
      ),
    );
  }
}
