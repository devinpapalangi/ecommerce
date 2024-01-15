import 'package:ecommerce/commons/widgets/appbar/appbar.dart';
import 'package:ecommerce/features/shop/screens/widgets/product_review/overall_rating.dart';
import 'package:ecommerce/features/shop/screens/widgets/product_review/star_rating_indicator.dart';
import 'package:ecommerce/features/shop/screens/widgets/product_review/user_review_card.dart';
import 'package:ecommerce/utils/contants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'Reviews and Rating',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Ratings and reviews are verified and from people who use the same type of device that you use.',
              ),
              const Gap(TSizes.spaceBtwItems),
              const OverallRating(),
              const StarRatingIndicator(
                rating: 4.2,
              ),
              Text(
                "12.611",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const Gap(TSizes.spaceBtwSections),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
