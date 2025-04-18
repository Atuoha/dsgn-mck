import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:real_estate_mock/screens/home/home.dart';
import 'package:real_estate_mock/screens/map_view/map_view.dart';
import 'constants/app_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/map_view': (context) => const MapViewScreen(),
      },
    );
  }
}
