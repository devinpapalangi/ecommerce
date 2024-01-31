import 'package:ecommerce/commons/widgets/layout/grid_layout.dart';
import 'package:ecommerce/commons/widgets/products/product_cards/product_card_vertical.dart';
import 'package:ecommerce/commons/widgets/shimmer_effect/vertical_product_shimmer.dart';
import 'package:ecommerce/commons/widgets/texts/section_heading.dart';
import 'package:ecommerce/features/shop/controllers/brands_controller.dart';
import 'package:ecommerce/features/shop/controllers/category_controller.dart';
import 'package:ecommerce/features/shop/models/category_model.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/features/shop/screens/all_shop.dart';
import 'package:ecommerce/features/shop/screens/widgets/all_brand_products.dart';
import 'package:ecommerce/features/shop/screens/widgets/category_brand/category_brand.dart';
import 'package:ecommerce/features/shop/screens/widgets/store/brand_showcase.dart';
import 'package:ecommerce/utils/contants/image_strings.dart';
import 'package:ecommerce/utils/contants/sizes.dart';
import 'package:ecommerce/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              CategoryBrand(category: category),
              const Gap(TSizes.spaceBtwItems),
              FutureBuilder(
                  future: categoryController.getCategoryProducts(
                      categoryId: category.id),
                  builder: (_, snapshot) {
                    final response =
                        TCloudHelperFunctions.checkMultiRecordState(
                            snapshot: snapshot,
                            loader: VerticalProductShimmer());
                    if (response != null) return response;

                    final products = snapshot.data!;

                    return Column(
                      children: [
                        SectionHeading(
                          title: 'You might like',
                          onPressed: () => Get.to(AllProductsScreen(
                              title: category.name,
                              futureMethod:
                                  categoryController.getCategoryProducts(
                                      categoryId: category.id))),
                        ),
                        const Gap(TSizes.spaceBtwItems),
                        GridLayout(
                          itemCount: products.length,
                          itemBuilder: (_, index) => ProductCardVertical(
                            product: products[index],
                          ),
                        ),
                      ],
                    );
                  }),
            ],
          ),
        ),
      ],
    );
  }
}
