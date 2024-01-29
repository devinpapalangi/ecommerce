import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/commons/widgets/appbar/appbar.dart';
import 'package:ecommerce/commons/widgets/shimmer_effect/vertical_product_shimmer.dart';
import 'package:ecommerce/features/shop/controllers/product/all_product_controller.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/features/shop/screens/widgets/all_shop/sortable_products.dart';
import 'package:ecommerce/utils/contants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen(
      {super.key, required this.title, required this.query, this.futureMethod});
  final String title;
  final Query query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductController());
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: FutureBuilder(
            builder: (context, snapshot) {
              const loader = VerticalProductShimmer();

              if (snapshot.connectionState == ConnectionState.waiting) {
                return loader;
              }

              if (!snapshot.hasData ||
                  snapshot.data == null ||
                  snapshot.data!.isEmpty) {
                return const Center(
                  child: Text('No Data Found!'),
                );
              }

              if (snapshot.hasError) {
                return const Center(
                  child: Text('Something went wrong!'),
                );
              }

              final products = snapshot.data!;

              return SortableProducts(
                products: products,
              );
            },
            future: futureMethod ?? controller.fetchProductByQuery(query),
          ),
        ),
      ),
    );
  }
}
