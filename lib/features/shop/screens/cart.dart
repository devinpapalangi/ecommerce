import 'package:ecommerce/commons/widgets/appbar/appbar.dart';
import 'package:ecommerce/features/shop/screens/checkout.dart';
import 'package:ecommerce/features/shop/screens/widgets/cart/bulk_cart_items.dart';
import 'package:ecommerce/utils/contants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () => Get.to(() => const CheckoutScreen()),
            child: const Text('Checkout \$256.0')),
      ),
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: BulkCartItems(),
      ),
    );
  }
}
