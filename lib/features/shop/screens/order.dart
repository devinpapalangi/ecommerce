import 'package:ecommerce/commons/widgets/appbar/appbar.dart';
import 'package:ecommerce/features/shop/screens/widgets/order/bulk_order_items.dart';
import 'package:ecommerce/utils/contants/sizes.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text(
          'My Order',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace),
            child: BulkOrderItem()),
      ),
    );
  }
}
