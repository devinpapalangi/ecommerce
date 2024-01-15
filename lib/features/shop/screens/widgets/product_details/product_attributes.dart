import 'package:ecommerce/commons/widgets/chips/choice_chip.dart';
import 'package:ecommerce/commons/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerce/commons/widgets/texts/product_price.dart';
import 'package:ecommerce/commons/widgets/texts/product_title.dart';
import 'package:ecommerce/commons/widgets/texts/section_heading.dart';
import 'package:ecommerce/utils/contants/colors.dart';
import 'package:ecommerce/utils/contants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        RoundedContainer(
          padding: const EdgeInsets.all(TSizes.md),
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          child: Column(
            children: [
              Row(
                children: [
                  const SectionHeading(
                    title: 'Variation',
                    showActionButton: false,
                  ),
                  const Gap(TSizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const ProductTitleText(
                            text: 'Price : ',
                            smallSize: true,
                          ),
                          const Gap(TSizes.spaceBtwItems),
                          Text(
                            '\$25',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          const Gap(TSizes.spaceBtwItems),
                          const ProductPriceText(price: '20'),
                        ],
                      ),
                      Row(
                        children: [
                          const ProductTitleText(
                            text: 'Stock : ',
                            smallSize: true,
                          ),
                          const Gap(TSizes.spaceBtwItems),
                          Text(
                            'In Stock',
                            style: Theme.of(context).textTheme.titleMedium,
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
              const ProductTitleText(
                text:
                    'This is the description of the product and it can go up to max 4 lines',
                smallSize: true,
                maxLines: 4,
              )
            ],
          ),
        ),
        const Gap(TSizes.spaceBtwItems),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeading(
              title: 'Colors',
              showActionButton: false,
            ),
            const Gap(TSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                CustomChoiceChip(
                    label: 'Green', selected: false, onSelected: (value) {}),
                CustomChoiceChip(
                    label: 'Blue', selected: true, onSelected: (value) {}),
                CustomChoiceChip(
                    label: 'Yellow', selected: false, onSelected: (value) {}),
                CustomChoiceChip(
                    label: 'Green', selected: false, onSelected: (value) {}),
                CustomChoiceChip(
                    label: 'Blue', selected: true, onSelected: (value) {}),
                CustomChoiceChip(
                    label: 'Yellow', selected: false, onSelected: (value) {}),
                CustomChoiceChip(
                    label: 'Green', selected: false, onSelected: (value) {}),
                CustomChoiceChip(
                    label: 'Blue', selected: true, onSelected: (value) {}),
                CustomChoiceChip(
                    label: 'Yellow', selected: false, onSelected: (value) {}),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeading(
              title: 'Size',
              showActionButton: false,
            ),
            const Gap(TSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                CustomChoiceChip(
                    label: 'EU 34', selected: false, onSelected: (value) {}),
                CustomChoiceChip(
                    label: 'EU 36', selected: true, onSelected: (value) {}),
                CustomChoiceChip(
                    label: 'EU 38', selected: false, onSelected: (value) {}),
                CustomChoiceChip(
                    label: 'EU 34', selected: false, onSelected: (value) {}),
                CustomChoiceChip(
                    label: 'EU 36', selected: true, onSelected: (value) {}),
                CustomChoiceChip(
                    label: 'EU 38', selected: false, onSelected: (value) {}),
              ],
            ),
          ],
        )
      ],
    );
  }
}
