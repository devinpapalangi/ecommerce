import 'package:ecommerce/utils/contants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BillingAmountSection extends StatelessWidget {
  const BillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Subtotal',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              '\$256',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        const Gap(TSizes.spaceBtwItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Shipping',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              '\$6.0',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        const Gap(TSizes.spaceBtwItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Tax',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              '\$6.0',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        const Gap(TSizes.spaceBtwItems),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              '\$6.0',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
      ],
    );
  }
}
