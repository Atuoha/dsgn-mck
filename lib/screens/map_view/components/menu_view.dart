import 'package:flutter/material.dart';
import '../../../constants/app_color.dart';
import '../../../model/menu_item.dart';

class MenuView extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Positioned(
      left: 30,
      bottom: 160,
      child: Visibility(
        visible: isMenuShowing,
        child: TweenAnimationBuilder<double>(
          tween: Tween<double>(begin:0.0, end: isMenuShowing ? 1.0 : 0.0),
            builder: (context, value, child) {
              double height = value * (size.height / 3.85);
            return Opacity(
              opacity: value,
              child: Container(
                width: size.width / 2.1,
                height: height,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: menus.asMap().entries.map((entry) {
                    int index = entry.key;
                    MenuItem menu = entry.value;
                    return GestureDetector(
                      onTap: () => onItemTapped(index),
                      child: ListTile(
                        contentPadding: const EdgeInsets.only(left: 10),
                        leading: Icon(
                          menu.icon,
                          color: index == selectedMenuIndex
                              ? AppColors.primaryColor
                              : AppColors.menuItemInactiveColor,
                        ),
                        title: Text(
                          menu.title,
                          style: TextStyle(
                            color: index == selectedMenuIndex
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
            );
          }, duration: const Duration(seconds: 1),
        ),
      ),
    );
  }
}
