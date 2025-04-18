import 'package:flutter/material.dart';
import '../../../constants/enum/offer_type.dart';
import 'offer_card.dart';

class OfferWidget extends StatelessWidget {
  const OfferWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        OfferCard(
          title: 'BUY',
          offerCount: '1034',
          offerType: OfferType.buy,
        ),
        OfferCard(
          title: 'RENT',
          offerCount: '2212',
          offerType: OfferType.rent,
        ),
      ],
    );
  }
}
