import 'package:ecommerce/commons/widgets/layout/grid_layout.dart';
import 'package:ecommerce/commons/widgets/products/product_cards/product_card_vertical.dart';
import 'package:ecommerce/commons/widgets/texts/section_heading.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/features/shop/screens/widgets/store/brand_showcase.dart';
import 'package:ecommerce/utils/contants/image_strings.dart';
import 'package:ecommerce/utils/contants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({
    super.key,
    required this.category,
  });

  final String category;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const BrandShowcase(
                images: [
                  TImages.productImage1,
                  TImages.productImage2,
                  TImages.productImage3
                ],
              ),
              const Gap(TSizes.spaceBtwItems),
              SectionHeading(
                title: 'You might like',
                onPressed: () {},
              ),
              const Gap(TSizes.spaceBtwItems),
              GridLayout(
                itemCount: 6,
                itemBuilder: (_, index) => ProductCardVertical(
                  product: ProductModel.empty(),
                ),
              ),
              const Gap(TSizes.spaceBtwItems),
            ],
          ),
        ),
      ],
    );
  }
}
