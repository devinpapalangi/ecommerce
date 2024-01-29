import 'package:ecommerce/commons/widgets/image_text_widget/vertical_image_text.dart';
import 'package:ecommerce/features/shop/controllers/category_controller.dart';
import 'package:ecommerce/features/shop/screens/sub_categories.dart';
import 'package:ecommerce/commons/widgets/shimmer_effect/category_shimmer.dart';
import 'package:ecommerce/utils/contants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
      child: Obx(() {
        if (controller.isLoading.value) return const CategoryShimmer();
        if (controller.featuredCategories.isEmpty) {
          return Center(
            child: Text(
              'No data found',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .apply(color: Colors.white),
            ),
          );
        }

        return SizedBox(
          height: 80,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: controller.featuredCategories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              final category = controller.featuredCategories[index];
              return VerticalImageText(
                image: category.image,
                title: category.name,
                onTap: () => Get.to(
                  () => const SubCategoriesScreen(),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
