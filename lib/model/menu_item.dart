import 'package:flutter/cupertino.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class MenuItem {
  final String title;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.icon,
  });
}

List<MenuItem> menus = [
  const MenuItem(title: 'Cosy Areas', icon: Iconsax.shield_tick_copy),
  const MenuItem(title: 'Price', icon: Iconsax.wallet_3_copy),
  const MenuItem(title: 'Infrastructure', icon: Iconsax.trash_copy),
  const MenuItem(title: 'Without any layer', icon: Iconsax.layer_copy),
];
