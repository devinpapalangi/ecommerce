import 'package:ecommerce/commons/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:ecommerce/commons/widgets/custom_shapes/containers/search_container.dart';
import 'package:ecommerce/commons/widgets/layout/grid_layout.dart';
import 'package:ecommerce/commons/widgets/products/product_cards/product_card_vertical.dart';
import 'package:ecommerce/commons/widgets/texts/section_heading.dart';
import 'package:ecommerce/features/shop/screens/all_shop.dart';
import 'package:ecommerce/features/shop/screens/widgets/home/home_appbar.dart';
import 'package:ecommerce/features/shop/screens/widgets/home/home_categories.dart';
import 'package:ecommerce/features/shop/screens/widgets/home/promo_slider.dart';
import 'package:ecommerce/utils/contants/colors.dart';
import 'package:ecommerce/utils/contants/image_strings.dart';
import 'package:ecommerce/utils/contants/sizes.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  const PromoSlider(
                    banners: [
                      TImages.promoBanner1,
                      TImages.promoBanner2,
                      TImages.promoBanner3
                    ],
                  ),
                  const Gap(TSizes.spaceBtwSections),
                  SectionHeading(
                    title: 'Popular Products',
                    showActionButton: true,
                    onPressed: () => Get.to(
                      () => const AllProductsScreen(),
                    ),
                  ),
                  GridLayout(
                    itemCount: 4,
                    itemBuilder: (_, index) => const ProductCardVertical(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
