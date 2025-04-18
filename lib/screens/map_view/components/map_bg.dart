import 'package:flutter/material.dart';
import '../../../gen/assets.gen.dart';

class MapBG extends StatelessWidget {
  const MapBG({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            Assets.images.map2.path,
          ),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
