import 'package:ecommerce/commons/widgets/shimmer_effect/shimmer_effect.dart';
import 'package:ecommerce/utils/contants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({
    super.key,
    this.itemCount = 6,
  });

  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (_, __) {
            return const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TShimmerEffect(
                  width: 55,
                  height: 55,
                  radius: 55,
                ),
                Gap(
                  TSizes.spaceBtwItems / 2,
                ),
                TShimmerEffect(
                  width: 55,
                  height: 8,
                ),
              ],
            );
          },
          separatorBuilder: (_, __) => const Gap(TSizes.spaceBtwItems),
          itemCount: itemCount),
    );
  }
}
