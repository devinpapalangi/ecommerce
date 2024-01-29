import 'package:ecommerce/commons/widgets/appbar/appbar.dart';
import 'package:ecommerce/features/shop/models/brand_model.dart';
import 'package:ecommerce/features/shop/screens/widgets/all_shop/sortable_products.dart';
import 'package:ecommerce/features/shop/screens/widgets/store/brand_cart.dart';
import 'package:ecommerce/utils/contants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AllBrandProducts extends StatelessWidget {
  const AllBrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text(
          'Nike',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              BrandCard(
                brand: BrandModel.empty(),
                showBorder: true,
              ),
              const Gap(TSizes.spaceBtwItems),
              // const SortableProducts()
            ],
          ),
        ),
      ),
    );
  }
}
