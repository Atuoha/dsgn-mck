import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'components/bg_widget.dart';
import 'components/bottom_nav_widget.dart';
import 'components/custom_app_bar.dart';
import 'components/greeting_widget.dart';
import 'components/intro_text.dart';
import 'components/offer_widget.dart';
import 'components/property_list_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: ContainerBG(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomAppBar(size: size),
                        const Gap(20),
                        const GreetingWidget(),
                        const Gap(5),
                        const IntroText(),
                        const Gap(30),
                        const OfferWidget(),
                      ],
                    ),
                  ),
                  const Gap(15),
                   PropertyListWidget(size: size),
                  
                ],
              ),
            ),
            const Positioned(
              bottom: 20,
              left: 70,
              right: 70,
              child: BottomNav(),
            ),
          ],
        ),
      ),
    );
  }
}
