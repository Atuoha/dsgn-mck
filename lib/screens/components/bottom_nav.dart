import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import '../../constants/app_color.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({
    super.key,
    required this.index,
  });

  final int index;

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  late int selectedIndex;

  void onItemTapped(int index) {
    if (selectedIndex != index) {
      setState(() {
        selectedIndex = index;
      });

      switch (index) {
        case 2:
          Navigator.pushNamed(context, '/');
          break;
        case 0:
          Navigator.pushNamed(context, '/map_view');
          break;
      }
    }
  }

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.navBg.withOpacity(0.9),
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildCustomNavItem(Iconsax.search_normal_1, 0),
          _buildCustomNavItem(Iconsax.message, 1),
          _buildCustomNavItem(Iconsax.home, 2),
          _buildCustomNavItem(Iconsax.heart, 3),
          _buildCustomNavItem(Iconsax.user, 4),
        ],
      ),
    );
  }

  Widget _buildCustomNavItem(IconData icon, int index) {
    bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: CircleAvatar(
        backgroundColor:
            isSelected ? AppColors.primaryColor : AppColors.blackColor,
        child: Icon(
          icon,
          color: Colors.white,
          size: 22,
        ),
      ),
    );
  }
}
