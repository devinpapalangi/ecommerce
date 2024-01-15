import 'package:ecommerce/commons/widgets/image_text_widget/brand_title_with_icon.dart';
import 'package:ecommerce/commons/widgets/images/rounded_images.dart';
import 'package:ecommerce/commons/widgets/texts/product_title.dart';
import 'package:ecommerce/utils/contants/colors.dart';
import 'package:ecommerce/utils/contants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.image,
    required this.brand,
    required this.productName,
    required this.color,
    required this.size,
  });

  final String image;
  final String brand;
  final String productName;
  final String color;
  final String size;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        RoundedImage(
          imageUrl: image,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(TSizes.sm),
          backgroundColor: dark ? TColors.darkerGrey : TColors.light,
        ),
        const Gap(TSizes.spaceBtwItems),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BrandTitleWithIcon(
              title: brand,
            ),
            Flexible(
              child: ProductTitleText(
                text: productName,
                maxLines: 1,
              ),
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Color ',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  TextSpan(
                    text: '$color ',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  TextSpan(
                    text: 'Size ',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  TextSpan(
                    text: '$size ',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
