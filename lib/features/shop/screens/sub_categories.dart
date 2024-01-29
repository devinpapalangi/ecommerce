import 'package:ecommerce/commons/widgets/appbar/appbar.dart';
import 'package:ecommerce/commons/widgets/images/rounded_images.dart';
import 'package:ecommerce/commons/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:ecommerce/commons/widgets/texts/section_heading.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/utils/contants/image_strings.dart';
import 'package:ecommerce/utils/contants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'Sport',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const RoundedImage(
                imageUrl: TImages.banner4,
                applyImageRadius: true,
                width: double.infinity,
              ),
              const Gap(TSizes.spaceBtwSections),
              Column(
                children: [
                  const SectionHeading(title: 'Sport Shoes'),
                  const Gap(TSizes.spaceBtwItems / 2),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                        separatorBuilder: (_, __) =>
                            const Gap(TSizes.spaceBtwItems),
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) => ProductCardHorizontal(
                              product: ProductModel.empty(),
                            )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
