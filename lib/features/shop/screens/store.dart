import 'package:ecommerce/commons/widgets/appbar/appbar.dart';
import 'package:ecommerce/commons/widgets/appbar/tabbar.dart';
import 'package:ecommerce/commons/widgets/custom_shapes/containers/search_container.dart';
import 'package:ecommerce/commons/widgets/layout/grid_layout.dart';
import 'package:ecommerce/commons/widgets/products/cart/cart_menu_icons.dart';
import 'package:ecommerce/commons/widgets/texts/section_heading.dart';
import 'package:ecommerce/features/shop/screens/all_brand.dart';
import 'package:ecommerce/features/shop/screens/widgets/store/brand_cart.dart';
import 'package:ecommerce/features/shop/screens/widgets/store/category_tab.dart';
import 'package:ecommerce/utils/contants/colors.dart';
import 'package:ecommerce/utils/contants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: 5,
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
                          itemCount: 4,
                          mainAxisExtent: 80,
                          itemBuilder: (_, index) {
                            return const BrandCard(
                              showBorder: false,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  bottom: const CustomTabBar(
                    tabs: [
                      Tab(
                        child: Text('Sport'),
                      ),
                      Tab(
                        child: Text('Furniture'),
                      ),
                      Tab(
                        child: Text('Electronics'),
                      ),
                      Tab(
                        child: Text('Clothes'),
                      ),
                      Tab(
                        child: Text('Cosmethics'),
                      ),
                    ],
                  ),
                ),
              ];
            },
            body: const TabBarView(
              children: [
                CategoryTab(),
                CategoryTab(),
                CategoryTab(),
                CategoryTab(),
                CategoryTab(),
              ],
            )),
      ),
    );
  }
}
