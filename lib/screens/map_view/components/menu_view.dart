import 'package:flutter/material.dart';
import '../../../constants/app_color.dart';
import '../../../model/menu_item.dart';

class MenuView extends StatefulWidget {
  const MenuView({
    super.key,
    required this.isMenuShowing,
    required this.size,
    required this.selectedMenuIndex,
    required this.onItemTapped,
  });

  final bool isMenuShowing;
  final Size size;
  final int selectedMenuIndex;
  final Function onItemTapped;

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _heightAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _heightAnimation = Tween<double>(begin: 0.0, end: widget.size.height / 5.5)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void didUpdateWidget(covariant MenuView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isMenuShowing && !_controller.isAnimating) {
      _controller.forward();
    } else if (!widget.isMenuShowing && !_controller.isAnimating) {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 30,
      bottom: 160,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return _controller.value == 0
              ? const SizedBox.shrink() // Don't show when fully hidden
              : Opacity(
            opacity: _controller.value,
            child: SizedBox(
              height: _heightAnimation.value,
              width: widget.size.width / 2.1,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xffFAF5EC),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListView(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  children: menus.asMap().entries.map((entry) {
                    int index = entry.key;
                    MenuItem menu = entry.value;
                    return GestureDetector(
                      onTap: () => widget.onItemTapped(index),
                      child: ListTile(
                        dense: true,
                        contentPadding: const EdgeInsets.only(left: 10),
                        visualDensity: const VisualDensity(vertical: -3),
                        leading: Icon(
                          menu.icon,
                          color: index == widget.selectedMenuIndex
                              ? AppColors.primaryColor
                              : AppColors.menuItemInactiveColor,
                        ),
                        title: Text(
                          menu.title,
                          style: TextStyle(
                            color: index == widget.selectedMenuIndex
                                ? AppColors.primaryColor
                                : AppColors.menuItemInactiveColor,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
