import 'package:ecommerce/commons/widgets/layout/grid_layout.dart';
import 'package:ecommerce/commons/widgets/shimmer_effect/shimmer_effect.dart';
import 'package:ecommerce/utils/contants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class VerticalProductShimmer extends StatelessWidget {
  const VerticalProductShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return GridLayout(
      itemCount: itemCount,
      itemBuilder: (_, __) => const SizedBox(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TShimmerEffect(width: 180, height: 180),
            Gap(TSizes.spaceBtwItems),
            TShimmerEffect(width: 160, height: 15),
            Gap(TSizes.spaceBtwItems / 2),
            TShimmerEffect(width: 110, height: 15)
          ],
        ),
      ),
    );
  }
}
