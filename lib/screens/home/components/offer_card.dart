import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constants/app_color.dart';
import '../../../constants/enum/offer_type.dart';

class OfferCard extends StatefulWidget {
  final String title;
  final String offerCount;
  final OfferType offerType;

  const OfferCard({
    super.key,
    required this.title,
    required this.offerCount,
    required this.offerType,
  });

  @override
  State<OfferCard> createState() => _OfferCardState();
}

class _OfferCardState extends State<OfferCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<double> _scaleAnimation;

  int _currentCount = 0;
  late Timer _timer;
  late int _targetCount;

  @override
  void initState() {
    super.initState();

    _targetCount = int.parse(widget.offerCount.replaceAll(' ', ''));

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
    _startCounting();
  }

  void _startCounting() {
    const duration = Duration(milliseconds: 1);

    _timer = Timer.periodic(duration, (timer) {
      setState(() {
        if (_currentCount < _targetCount) {
          _currentCount++;
        } else {
          timer.cancel();
        }
      });
    });
  }



  String _formatCount(int count) {
    final String countString = count.toString();
    if (countString.length > 3) {
      return '${countString.substring(0, countString.length - 3)} ${countString.substring(countString.length - 3)}';
    }
    return countString;
  }


  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return ScaleTransition(
      scale: _scaleAnimation,
      child: FadeTransition(
        opacity: _opacityAnimation,
        child: Container(
          width: size.width * 0.4,
          height: size.width * 0.4,
          padding: const EdgeInsets.all(13),
          decoration: BoxDecoration(
            color: widget.offerType == OfferType.buy
                ? AppColors.primaryColor
                : Colors.white,
            shape: widget.offerType == OfferType.buy
                ? BoxShape.circle
                : BoxShape.rectangle,
            borderRadius: widget.offerType == OfferType.buy
                ? null
                : BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.title,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 18,
                    color: widget.offerType == OfferType.buy
                        ? Colors.white
                        : AppColors.accentColor,
                  ),
                ),
              ),
              const Gap(20),
              Text(
                _formatCount(_currentCount),
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: widget.offerType == OfferType.buy
                        ? Colors.white
                        : AppColors.accentColor,
                  ),
                ),
              ),
              Text(
                'offers',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 14,
                    color: widget.offerType == OfferType.buy
                        ? Colors.white
                        : AppColors.accentColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
