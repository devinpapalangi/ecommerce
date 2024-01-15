import 'package:ecommerce/commons/widgets/layout/grid_layout.dart';
import 'package:ecommerce/commons/widgets/products/product_cards/product_card_vertical.dart';
import 'package:ecommerce/utils/contants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SortableProducts extends StatelessWidget {
  const SortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Icons.sort)),
          items: [
            'Name',
            'Price',
            'Lower Price',
            'Sale',
            'Newest',
            'Popularity'
          ]
              .map((option) =>
                  DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
          onChanged: (value) {},
        ),
        const Gap(TSizes.spaceBtwSections),
        GridLayout(
            itemCount: 10,
            itemBuilder: (_, index) => const ProductCardVertical())
      ],
    );
  }
}
