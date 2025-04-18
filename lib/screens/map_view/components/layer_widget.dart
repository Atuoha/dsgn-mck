import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import '../../../constants/app_color.dart';

class LayerWidget extends StatefulWidget {
  const LayerWidget({
    super.key,
    required this.toggleMenu,
  });

  final Function toggleMenu;

  @override
  State<LayerWidget> createState() => _LayerWidgetState();
}

class _LayerWidgetState extends State<LayerWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<double> _scaleAnimation;

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
        curve: Curves.easeIn,
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 30,
      bottom: 90,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: FadeTransition(
          opacity: _opacityAnimation,
          child: Column(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: AppColors.componentColor.withOpacity(0.8),
                child: const Center(
                  child: Icon(
                    Iconsax.layer_copy,
                    color: Colors.white,
                  ),
                ),
              ),
              const Gap(10),
              GestureDetector(
                onTap: () => widget.toggleMenu(),
                child: CircleAvatar(
                  radius: 28,
                  backgroundColor: AppColors.componentColor.withOpacity(0.8),
                  child: const Center(
                    child: Icon(
                      Iconsax.send_2_copy,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
