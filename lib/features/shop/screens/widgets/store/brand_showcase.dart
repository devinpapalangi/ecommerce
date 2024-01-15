import 'package:ecommerce/commons/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerce/features/shop/screens/widgets/store/brand_cart.dart';
import 'package:ecommerce/utils/contants/colors.dart';
import 'package:ecommerce/utils/contants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class BrandShowcase extends StatelessWidget {
  const BrandShowcase({super.key, required this.images});

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      padding: const EdgeInsets.all(TSizes.md),
      showBorder: true,
      borderColor: TColors.darkGrey,
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Column(
        children: [
          const BrandCard(showBorder: false),
          Row(
            children: images
                .map((image) => brandTopProductImageWidget(image, context))
                .toList(),
          )
        ],
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Expanded(
      child: RoundedContainer(
        height: 100,
        backgroundColor: dark ? TColors.darkGrey : TColors.light,
        margin: const EdgeInsets.only(right: TSizes.sm),
        padding: const EdgeInsets.all(TSizes.md),
        child: Image(
          fit: BoxFit.contain,
          image: AssetImage(image),
        ),
      ),
    );
  }
}
