import 'package:ecommerce/commons/widgets/appbar/appbar.dart';
import 'package:ecommerce/commons/widgets/layout/grid_layout.dart';
import 'package:ecommerce/commons/widgets/texts/section_heading.dart';
import 'package:ecommerce/features/shop/controllers/brands_controller.dart';
import 'package:ecommerce/features/shop/screens/widgets/all_brand_products.dart';
import 'package:ecommerce/features/shop/screens/widgets/store/brand_cart.dart';
import 'package:ecommerce/utils/contants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class AllBrandScreen extends StatelessWidget {
  const AllBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BrandController());
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'Brand',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const SectionHeading(
                title: 'Brands',
                showActionButton: false,
              ),
              const Gap(TSizes.spaceBtwItems),
              GridLayout(
                itemCount: controller.brands.length,
                itemBuilder: (_, index) {
                  final brand = controller.brands[index];
                  return BrandCard(
                    brand: brand,
                    showBorder: true,
                    onTap: () => Get.to(
                      () => AllBrandProducts(
                        brand: brand,
                      ),
                    ),
                  );
                },
                mainAxisExtent: 80,
              )
            ],
          ),
        ),
      ),
    );
  }
}
