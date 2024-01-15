import 'package:ecommerce/commons/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerce/commons/widgets/image_text_widget/brand_title_with_icon.dart';
import 'package:ecommerce/commons/widgets/images/circular_images.dart';
import 'package:ecommerce/commons/widgets/texts/product_price.dart';
import 'package:ecommerce/commons/widgets/texts/product_title.dart';
import 'package:ecommerce/utils/contants/colors.dart';
import 'package:ecommerce/utils/contants/enums.dart';
import 'package:ecommerce/utils/contants/image_strings.dart';
import 'package:ecommerce/utils/contants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductMetadata extends StatelessWidget {
  const ProductMetadata({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            RoundedContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                horizontal: TSizes.sm,
                vertical: TSizes.xs,
              ),
              child: Text(
                '25%',
                style: Theme.of(context).textTheme.labelLarge!.apply(
                      color: TColors.black,
                    ),
              ),
            ),
            const Gap(TSizes.spaceBtwItems),
            Text(
              '\$250',
              style: Theme.of(context).textTheme.titleSmall!.apply(
                    decoration: TextDecoration.lineThrough,
                  ),
            ),
            const Gap(TSizes.spaceBtwItems),
            const ProductPriceText(
              price: '175',
              isLarge: true,
            )
          ],
        ),
        const Gap(TSizes.spaceBtwItems / 1.5),
        const ProductTitleText(text: 'Nike Air Max'),
        const Gap(TSizes.spaceBtwItems / 1.5),
        Row(
          children: [
            const ProductTitleText(text: 'Status'),
            const Gap(TSizes.spaceBtwItems),
            Text(
              'In Stock',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        const Gap(TSizes.spaceBtwItems / 1.5),
        Row(
          children: [
            CircularImage(
              image: TImages.nikeLogo,
              width: 32,
              height: 32,
              overlayColor: dark ? TColors.white : TColors.black,
            ),
            const BrandTitleWithIcon(
              title: 'Nike',
              textSizes: TextSizes.medium,
            ),
          ],
        ),
        const Gap(TSizes.spaceBtwItems / 1.5),
      ],
    );
  }
}
