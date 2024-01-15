import 'package:ecommerce/commons/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerce/utils/contants/colors.dart';
import 'package:ecommerce/utils/contants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

class BulkOrderItem extends StatelessWidget {
  const BulkOrderItem({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, index) => const Gap(TSizes.spaceBtwItems),
      itemCount: 4,
      itemBuilder: (_, index) => RoundedContainer(
        padding: const EdgeInsets.all(TSizes.md),
        showBorder: true,
        backgroundColor: dark ? TColors.dark : TColors.light,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Iconsax.ship),
                const Gap(TSizes.spaceBtwItems / 2),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Processing',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .apply(color: TColors.primary, fontWeightDelta: 2),
                      ),
                      Text(
                        '01 Sep 2023',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Iconsax.arrow_right_34,
                    size: TSizes.iconSm,
                  ),
                )
              ],
            ),
            const Gap(TSizes.spaceBtwItems),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      const Icon(Iconsax.tag),
                      const Gap(TSizes.spaceBtwItems / 2),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Order',
                              style: Theme.of(context).textTheme.labelMedium!,
                            ),
                            Text(
                              'CWT0012',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      const Icon(Iconsax.calendar),
                      const Gap(TSizes.spaceBtwItems),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Shipping Date',
                            style: Theme.of(context).textTheme.bodySmall!,
                          ),
                          Text(
                            '09 Sep 2023',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
