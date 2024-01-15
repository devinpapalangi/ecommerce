import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/commons/widgets/custom_shapes/containers/circular_container.dart';
import 'package:ecommerce/commons/widgets/images/rounded_images.dart';
import 'package:ecommerce/features/shop/controllers/home_controller.dart';
import 'package:ecommerce/utils/contants/colors.dart';
import 'package:ecommerce/utils/contants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class PromoSlider extends StatelessWidget {
  const PromoSlider({
    super.key,
    required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          items: banners
              .map(
                (url) => RoundedImage(imageUrl: url),
              )
              .toList(),
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
              for (int i = 0; i < banners.length; i++)
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
  }
}
