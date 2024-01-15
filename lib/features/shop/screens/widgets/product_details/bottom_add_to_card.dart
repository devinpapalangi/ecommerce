import 'package:ecommerce/commons/widgets/icons/circular_icon.dart';
import 'package:ecommerce/utils/contants/colors.dart';
import 'package:ecommerce/utils/contants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

class BottomAddToCard extends StatelessWidget {
  const BottomAddToCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: TSizes.defaultSpace, vertical: TSizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color: dark ? TColors.darkerGrey : TColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(TSizes.cardRadiusLg),
          topRight: Radius.circular(TSizes.cardRadiusLg),
        ),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            const CircularIcon(
              icon: Iconsax.minus,
              backgroundColor: TColors.darkGrey,
              width: 40,
              height: 40,
              color: TColors.white,
            ),
            const Gap(TSizes.spaceBtwItems),
            Text(
              '2',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const Gap(TSizes.spaceBtwItems),
            const CircularIcon(
              icon: Iconsax.add,
              backgroundColor: TColors.darkGrey,
              width: 40,
              height: 40,
              color: TColors.white,
            ),
          ],
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(TSizes.md),
            backgroundColor: TColors.black,
            side: const BorderSide(color: TColors.black),
          ),
          child: const Text('Add to Cart'),
        ),
      ]),
    );
  }
}
