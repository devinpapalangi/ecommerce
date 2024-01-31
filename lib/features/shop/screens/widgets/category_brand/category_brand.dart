import 'package:ecommerce/commons/widgets/shimmer_effect/box_shimmer.dart';
import 'package:ecommerce/commons/widgets/shimmer_effect/list_tile_shimmer.dart';
import 'package:ecommerce/features/shop/controllers/brands_controller.dart';
import 'package:ecommerce/features/shop/models/category_model.dart';
import 'package:ecommerce/features/shop/screens/widgets/store/brand_showcase.dart';
import 'package:ecommerce/utils/contants/sizes.dart';
import 'package:ecommerce/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class CategoryBrand extends StatelessWidget {
  const CategoryBrand({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BrandController());
    return FutureBuilder(
        future: controller.getBrandsForCategory(category.id),
        builder: (context, snapshot) {
          const loader = Column(
            children: [
              ListTileShimmer(),
              Gap(TSizes.spaceBtwItems),
              BoxShimmer(),
              Gap(TSizes.spaceBtwItems)
            ],
          );

          final widget = TCloudHelperFunctions.checkMultiRecordState(
              snapshot: snapshot, loader: loader);

          if (widget != null) return widget;

          final brands = snapshot.data!;

          return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: brands.length,
              itemBuilder: (_, index) {
                final brand = brands[index];
                return FutureBuilder(
                    future: controller.getBrandProducts(
                        brandId: brand.id, limit: 3),
                    builder: (context, snapshot) {
                      final widget =
                          TCloudHelperFunctions.checkMultiRecordState(
                              snapshot: snapshot, loader: loader);

                      if (widget != null) return widget;

                      final product = snapshot.data!;
                      return BrandShowcase(
                          images: product.map((e) => e.thumbnail).toList(),
                          brand: brand);
                    });
              });
        });
  }
}
