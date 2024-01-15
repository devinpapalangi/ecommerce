import 'package:ecommerce/commons/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerce/features/shop/screens/widgets/product_review/star_rating_indicator.dart';
import 'package:ecommerce/utils/contants/colors.dart';
import 'package:ecommerce/utils/contants/image_strings.dart';
import 'package:ecommerce/utils/contants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(TImages.userProfileImage1),
                ),
                const Gap(TSizes.spaceBtwItems),
                Text(
                  'John Doe',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
          ],
        ),
        const Gap(TSizes.spaceBtwItems),
        Row(
          children: [
            const StarRatingIndicator(rating: 4.5),
            const Gap(TSizes.spaceBtwItems),
            Text(
              '27 May 2023',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        const Gap(TSizes.spaceBtwItems),
        const ReadMoreText(
          'This as a card containing user description of the reviews. I dont know how much word i need to type to see the show less and show more button broo',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: " show less",
          trimCollapsedText: " show more",
          moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
          lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
        ),
        const Gap(TSizes.spaceBtwItems),
        RoundedContainer(
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(TSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "T's Store",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      '27 May 2023',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                const Gap(TSizes.spaceBtwItems),
                const ReadMoreText(
                  'This as a card containing user description of the reviews. I dont know how much word i need to type to see the show less and show more button broo',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: " show less",
                  trimCollapsedText: " show more",
                  moreStyle:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  lessStyle:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                ),
              ],
            ),
          ),
        ),
        const Gap(TSizes.spaceBtwSections)
      ],
    );
  }
}
