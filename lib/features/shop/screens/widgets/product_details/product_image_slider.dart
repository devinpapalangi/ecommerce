import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/commons/widgets/appbar/appbar.dart';
import 'package:ecommerce/commons/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:ecommerce/commons/widgets/icons/circular_icon.dart';
import 'package:ecommerce/features/shop/controllers/product/image_controller.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/utils/contants/colors.dart';
import 'package:ecommerce/utils/contants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(ImageController());
    final images = controller.getAllProductImages(product);
    return CurvedEdgesWidget(
      child: Container(
        color: dark ? TColors.darkGrey : TColors.light,
        child: Stack(
          children: [
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(TSizes.productImageRadius * 2),
                child: Center(child: Obx(
                  () {
                    final image = controller.selectedProductImage.value;
                    return GestureDetector(
                      onTap: () => controller.showEnlargedImage(image),
                      child: CachedNetworkImage(
                        imageUrl: image,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                CircularProgressIndicator(
                          value: downloadProgress.progress,
                          color: TColors.primary,
                        ),
                      ),
                    );
                  },
                )),
              ),
            ),
            if (product.productVariations != null &&
                product.productVariations!.isNotEmpty)
              Positioned(
                right: 0,
                bottom: 30,
                left: TSizes.defaultSpace,
                child: SizedBox(
                  height: 80,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (_, index) => Obx(
                      () {
                        final imageUrl = images[index];
                        final imageSelected =
                            controller.selectedProductImage.value ==
                                images[index];
                        return GestureDetector(
                          onTap: () => controller.selectedProductImage.value =
                              images[index],
                          child: Container(
                            height: 80,
                            width: 80,
                            padding: const EdgeInsets.all(TSizes.sm),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(TSizes.lg),
                              color: dark ? TColors.dark : TColors.white,
                              border: Border.all(
                                  width: 2.3,
                                  color: imageSelected
                                      ? TColors.primary
                                      : Colors.transparent),
                            ),
                            child: CachedNetworkImage(
                              width: 80,
                              height: 80,
                              imageUrl: imageUrl,
                            ),
                          ),
                        );
                      },
                    ),
                    separatorBuilder: (_, __) =>
                        const Gap(TSizes.spaceBtwItems),
                    itemCount: images.length,
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
