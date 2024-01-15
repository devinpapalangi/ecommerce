import 'package:ecommerce/features/shop/screens/widgets/product_review/rating_indicator.dart';
import 'package:flutter/material.dart';

class OverallRating extends StatelessWidget {
  const OverallRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            '4.2',
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        const Expanded(
          flex: 7,
          child: Column(
            children: [
              RatingIndicator(
                label: '5',
                value: 0.9,
              ),
              RatingIndicator(
                label: '4',
                value: 0.8,
              ),
              RatingIndicator(
                label: '3',
                value: 0.7,
              ),
              RatingIndicator(
                label: '2',
                value: 0.6,
              ),
              RatingIndicator(
                label: '1',
                value: 0.5,
              ),
            ],
          ),
        )
      ],
    );
  }
}
