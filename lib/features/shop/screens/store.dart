import 'package:ecommerce/commons/widgets/appbar/appbar.dart';
import 'package:ecommerce/commons/widgets/appbar/tabbar.dart';
import 'package:ecommerce/commons/widgets/custom_shapes/containers/search_container.dart';
import 'package:ecommerce/commons/widgets/layout/grid_layout.dart';
import 'package:ecommerce/commons/widgets/products/cart/cart_menu_icons.dart';
import 'package:ecommerce/commons/widgets/texts/section_heading.dart';
import 'package:ecommerce/features/shop/controllers/brands_controller.dart';
import 'package:ecommerce/features/shop/screens/all_brand.dart';
import 'package:ecommerce/features/shop/screens/widgets/store/brand_cart.dart';
import 'package:ecommerce/features/shop/screens/widgets/store/category_tab.dart';
import 'package:ecommerce/utils/contants/colors.dart';
import 'package:ecommerce/utils/contants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../controllers/category_controller.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());
    final brandController = Get.put(BrandController());
    final dark = THelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: categoryController.featuredCategories.length,
      child: Scaffold(
        appBar: CustomAppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [CartCounterIcon(onPressed: () {})],
        ),
        body: NestedScrollView(
            headerSliverBuilder: (_, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: true,
                  backgroundColor: dark ? TColors.black : TColors.white,
                  expandedHeight: 440,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.all(TSizes.defaultSpace),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        const Gap(TSizes.spaceBtwItems),
                        const SearchContainer(
                          text: 'Search in store',
                          showBorder: true,
                          showBackground: false,
                          padding: EdgeInsets.zero,
                        ),
                        const Gap(TSizes.spaceBtwSections),
                        SectionHeading(
                          title: 'Featured Brands',
                          onPressed: () => Get.to(() => const AllBrandScreen()),
                        ),
                        const Gap(TSizes.spaceBtwItems / 1.5),
                        GridLayout(
                          itemCount: brandController.brands.length,
                          mainAxisExtent: 80,
                          itemBuilder: (_, index) {
                            final brand = brandController.brands[index];
                            return BrandCard(
                              brand: brand,
                              showBorder: false,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  bottom: CustomTabBar(
                      tabs: categoryController.featuredCategories
                          .map(
                              (categories) => Tab(child: Text(categories.name)))
                          .toList()),
                ),
              ];
            },
            body: TabBarView(
                children: categoryController.featuredCategories
                    .map((categories) => CategoryTab(category: categories.name))
                    .toList())),
      ),
    );
  }
}
