import 'package:ecommerce/commons/widgets/appbar/appbar.dart';
import 'package:ecommerce/commons/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:ecommerce/commons/widgets/icons/circular_icon.dart';
import 'package:ecommerce/commons/widgets/images/rounded_images.dart';
import 'package:ecommerce/utils/contants/colors.dart';
import 'package:ecommerce/utils/contants/image_strings.dart';
import 'package:ecommerce/utils/contants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return CurvedEdgesWidget(
      child: Container(
        color: dark ? TColors.darkGrey : TColors.light,
        child: Stack(
          children: [
            const SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(TSizes.productImageRadius * 2),
                child: Center(
                  child: Image(
                    image: AssetImage(TImages.productImage1),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 30,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (_, index) => RoundedImage(
                    width: 80,
                    padding: const EdgeInsets.all(TSizes.sm),
                    border: Border.all(color: TColors.primary),
                    backgroundColor: dark ? TColors.dark : TColors.light,
                    fit: BoxFit.contain,
                    imageUrl: TImages.productImage3,
                  ),
                  separatorBuilder: (_, __) => const Gap(TSizes.spaceBtwItems),
                  itemCount: 10,
                ),
              ),
            ),
            const CustomAppBar(
              showBackArrow: true,
              actions: [
                CircularIcon(
                  icon: Iconsax.heart5,
                  color: Colors.red,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
