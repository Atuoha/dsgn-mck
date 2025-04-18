import 'package:flutter/cupertino.dart';
import '../../../constants/app_color.dart';

class ContainerBG extends StatelessWidget {
  const ContainerBG({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          stops: [0.3, 1.0],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.whiteShadeColor,
            AppColors.primaryColor,
          ],
        ),
      ),
      child: child,
    );
  }
}
