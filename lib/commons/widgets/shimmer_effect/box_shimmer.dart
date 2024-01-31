import 'package:ecommerce/commons/widgets/shimmer_effect/shimmer_effect.dart';
import 'package:ecommerce/utils/contants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BoxShimmer extends StatelessWidget {
  const BoxShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TShimmerEffect(width: 150, height: 110),
            ),
            Gap(TSizes.spaceBtwItems),
            Expanded(
              child: TShimmerEffect(width: 150, height: 110),
            ),
            Gap(TSizes.spaceBtwItems),
            Expanded(
              child: TShimmerEffect(width: 150, height: 110),
            ),
          ],
        )
      ],
    );
  }
}
