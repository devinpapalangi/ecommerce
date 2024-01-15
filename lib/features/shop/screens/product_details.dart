import 'package:ecommerce/commons/widgets/texts/section_heading.dart';
import 'package:ecommerce/features/shop/screens/product_review.dart';
import 'package:ecommerce/features/shop/screens/widgets/product_details/bottom_add_to_card.dart';
import 'package:ecommerce/features/shop/screens/widgets/product_details/product_attributes.dart';
import 'package:ecommerce/features/shop/screens/widgets/product_details/product_image_slider.dart';
import 'package:ecommerce/features/shop/screens/widgets/product_details/product_metadata.dart';
import 'package:ecommerce/features/shop/screens/widgets/product_details/ratings_and_share.dart';
import 'package:ecommerce/utils/contants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomAddToCard(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ProductImageSlider(),
            Padding(
              padding: const EdgeInsets.only(
                right: TSizes.defaultSpace,
                left: TSizes.defaultSpace,
                bottom: TSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  const RatingAndShare(),
                  const ProductMetadata(),
                  const ProductAttributes(),
                  const Gap(TSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text('Checkout')),
                  ),
                  const Gap(TSizes.spaceBtwItems),
                  const SectionHeading(
                    title: 'Description',
                    showActionButton: false,
                  ),
                  const Gap(TSizes.spaceBtwItems),
                  const ReadMoreText(
                    'This is a product description for Nike Air , you can add lots of text here and it will be hidden when it pass 2 lines, i dont know why this is not hidden yet. How many lines doi have to write more',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show More',
                    trimExpandedText: ' Less',
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                  const Divider(),
                  const Gap(TSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SectionHeading(
                        title: 'Reviews(199)',
                        showActionButton: false,
                      ),
                      IconButton(
                          onPressed: () =>
                              Get.to(() => const ProductReviewScreen()),
                          icon: const Icon(
                            Iconsax.arrow_right_3,
                            size: 18,
                          ))
                    ],
                  ),
                  const Gap(TSizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
