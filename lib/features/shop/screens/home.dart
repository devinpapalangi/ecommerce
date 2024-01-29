import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/commons/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:ecommerce/commons/widgets/custom_shapes/containers/search_container.dart';
import 'package:ecommerce/commons/widgets/layout/grid_layout.dart';
import 'package:ecommerce/commons/widgets/products/product_cards/product_card_vertical.dart';
import 'package:ecommerce/commons/widgets/shimmer_effect/vertical_product_shimmer.dart';
import 'package:ecommerce/commons/widgets/texts/section_heading.dart';
import 'package:ecommerce/features/shop/controllers/product/products_controller.dart';
import 'package:ecommerce/features/shop/screens/all_shop.dart';
import 'package:ecommerce/features/shop/screens/widgets/home/home_appbar.dart';
import 'package:ecommerce/features/shop/screens/widgets/home/home_categories.dart';
import 'package:ecommerce/features/shop/screens/widgets/home/promo_slider.dart';
import 'package:ecommerce/utils/contants/colors.dart';
import 'package:ecommerce/utils/contants/sizes.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Header
            const TPrimaryHeaderContainer(
              child: Column(
                children: [
                  //Appbar
                  HomeAppBar(),
                  Gap(TSizes.spaceBtwSections),

                  //Search Bar
                  SearchContainer(
                    icon: Iconsax.search_normal,
                    text: 'Search in store',
                  ),
                  Gap(TSizes.spaceBtwSections),

                  //Horizontal ListView
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        SectionHeading(
                          title: 'Product Categories',
                          showActionButton: false,
                          textColor: TColors.white,
                        ),
                        Gap(TSizes.spaceBtwItems)
                      ],
                    ),
                  ),
                  HomeCategories(),
                  Gap(TSizes.spaceBtwSections),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const PromoSlider(),
                  const Gap(TSizes.spaceBtwSections),
                  SectionHeading(
                    title: 'Popular Products',
                    showActionButton: true,
                    onPressed: () => Get.to(
                      () => AllProductsScreen(
                        title: 'Popular Products',
                        query: FirebaseFirestore.instance
                            .collection('Products')
                            .where('IsFeature', isEqualTo: true),
                        futureMethod: controller.fetchAllProducts(),
                      ),
                    ),
                  ),
                  Obx(() {
                    if (controller.isLoading.value) {
                      return const VerticalProductShimmer();
                    }

                    if (controller.featuredProducts.isEmpty) {
                      return Center(
                        child: Text(
                          'No Data Found!',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      );
                    }
                    return GridLayout(
                      itemCount: controller.featuredProducts.length,
                      itemBuilder: (_, index) => ProductCardVertical(
                          product: controller.featuredProducts[index]),
                    );
                  })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
