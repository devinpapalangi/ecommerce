import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/commons/widgets/custom_shapes/containers/circular_container.dart';
import 'package:ecommerce/commons/widgets/images/rounded_images.dart';
import 'package:ecommerce/commons/widgets/shimmer_effect/shimmer_effect.dart';
import 'package:ecommerce/features/shop/controllers/banner_controller.dart';
import 'package:ecommerce/utils/contants/colors.dart';
import 'package:ecommerce/utils/contants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class PromoSlider extends StatelessWidget {
  const PromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(() {
      if (controller.isLoading.value) {
        return const TShimmerEffect(width: double.infinity, height: 190);
      }

      if (controller.banners.isEmpty) {
        return const Center(
          child: Text('No data found!'),
        );
      }
      return Column(
        children: [
          CarouselSlider(
            items: controller.banners.map((banner) {
              return RoundedImage(
                imageUrl: banner.imageUrl,
                isNetworkImage: true,
                onPressed: () => Get.toNamed(banner.targetScreen),
              );
            }).toList(),
            options: CarouselOptions(
                viewportFraction: 1,
                onPageChanged: (index, _) =>
                    controller.updatePageIndicator(index)),
          ),
          const Gap(TSizes.spaceBtwItems),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < controller.banners.length; i++)
                  CircularContainer(
                    width: 20,
                    height: 4,
                    margin: const EdgeInsets.only(right: 10),
                    backgroundColor: controller.carouselCurrentIndex.value == i
                        ? TColors.primary
                        : TColors.grey,
                  )
              ],
            ),
          )
        ],
      );
    });
  }
}
