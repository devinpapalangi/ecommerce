import 'package:ecommerce/commons/widgets/appbar/appbar.dart';
import 'package:ecommerce/features/shop/screens/widgets/all_shop/sortable_products.dart';
import 'package:ecommerce/utils/contants/sizes.dart';
import 'package:flutter/material.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'Popular Products',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: SortableProducts(),
        ),
      ),
    );
  }
}
