import 'package:ecommerce/commons/styles/shadow_styles.dart';
import 'package:ecommerce/commons/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerce/commons/widgets/icons/circular_icon.dart';
import 'package:ecommerce/commons/widgets/image_text_widget/brand_title_with_icon.dart';
import 'package:ecommerce/commons/widgets/images/rounded_images.dart';
import 'package:ecommerce/commons/widgets/texts/product_price.dart';
import 'package:ecommerce/commons/widgets/texts/product_title.dart';
import 'package:ecommerce/features/shop/screens/product_details.dart';
import 'package:ecommerce/utils/contants/colors.dart';
import 'package:ecommerce/utils/contants/image_strings.dart';
import 'package:ecommerce/utils/contants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProductCardHorizontal extends StatelessWidget {
  const ProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => const ProductDetailScreen()),
      child: Container(
        width: 310,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            boxShadow: [
              TShadowStyles.horizontalProductShadow,
            ],
            borderRadius: BorderRadius.circular(TSizes.productImageRadius),
            color: dark ? TColors.darkerGrey : TColors.lightContainer),
        child: Row(
          children: [
            RoundedContainer(
              height: 120,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  const SizedBox(
                    height: 120,
                    width: 120,
                    child: RoundedImage(
                      imageUrl: TImages.productImage1,
                      applyImageRadius: true,
                    ),
                  ),
                  Positioned(
                    top: 12,
                    child: RoundedContainer(
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
                  ),
                  const Positioned(
                      top: 0,
                      right: 0,
                      child: CircularIcon(
                        icon: Iconsax.heart5,
                        color: Colors.red,
                      ))
                ],
              ),
            ),
            const Gap(TSizes.spaceBtwItems / 2),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: TSizes.sm),
                child: Column(
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProductTitleText(
                          text: 'Nike Air Max',
                          smallSize: true,
                        ),
                        Gap(TSizes.spaceBtwItems / 2),
                        BrandTitleWithIcon(title: 'Nike'),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Flexible(
                          child: ProductPriceText(
                            price: '256.0 - 280.50',
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: TColors.dark,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(TSizes.cardRadiusMd),
                              bottomRight: Radius.circular(TSizes.cardRadiusMd),
                            ),
                          ),
                          child: const SizedBox(
                            width: TSizes.iconLg * 1.2,
                            height: TSizes.iconLg * 1.2,
                            child: Center(
                              child: Icon(
                                Iconsax.add,
                                color: TColors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
