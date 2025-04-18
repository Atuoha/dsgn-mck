import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constants/app_color.dart';

class IntroText extends StatefulWidget {
  const IntroText({super.key});

  @override
  State<IntroText> createState() => _IntroTextState();
}

class _IntroTextState extends State<IntroText> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    // Slide animation (bottom to top)
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),  // Start from below the screen
      end: Offset.zero,              // End at normal position
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    // Opacity animation (start invisible, end fully visible)
    _opacityAnimation = Tween<double>(
      begin: 0.0, // Fully transparent at the start
      end: 1.0,   // Fully visible at the end
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    // Start animation after widget is built
    Future.delayed(Duration.zero, () {
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
    return FadeTransition(
      opacity: _opacityAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: Text(
          'let\'s select your perfect place',
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              fontSize: 35,
              color: AppColors.blackColor,
            ),
          ),
        ),
      ),
    );
  }
}
