import 'dart:ui';
import '../constants/app_color.dart';
import '../gen/assets.gen.dart';

class Property {
  final String imageUrl;
  final String address;
  final Color blurColor;

  Property({
    required this.imageUrl,
    required this.address,
    required this.blurColor,
  });
}

final List<Property> properties = [
  Property(
    imageUrl: Assets.images.s1.path,
    address: 'Gladkova St., 25',
    blurColor: AppColors.blurColor1,
  ),
  Property(
    imageUrl: Assets.images.s2.path,
    address: 'Another St., 21',
    blurColor: AppColors.blurColor2,
  ),
  Property(
    imageUrl: Assets.images.s5.path,
    address: 'Trofaleva St., 43',
    blurColor: AppColors.blurColor3,
  ),
  Property(
    imageUrl: Assets.images.s4.path,
    address: 'Anywhere St., 19',
    blurColor: AppColors.blurColor4,
  ),
];
