import 'package:ecommerce/commons/widgets/chips/choice_chip.dart';
import 'package:ecommerce/commons/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerce/commons/widgets/texts/product_price.dart';
import 'package:ecommerce/commons/widgets/texts/product_title.dart';
import 'package:ecommerce/commons/widgets/texts/section_heading.dart';
import 'package:ecommerce/features/shop/controllers/product/variation_controller.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/utils/contants/colors.dart';
import 'package:ecommerce/utils/contants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(VariationController());
    return Obx(
      () => Column(
        children: [
          if (controller.selectedVariation.value.id.isNotEmpty)
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
                              if (controller.selectedVariation.value.salePrice >
                                  0)
                                Text(
                                  '\$${controller.selectedVariation.value.price}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .apply(
                                          decoration:
                                              TextDecoration.lineThrough),
                                ),
                              const Gap(TSizes.spaceBtwItems),
                              ProductPriceText(
                                  price: controller.getVariationPrice()),
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
                                controller.getProductVariationStocStatus(),
                                style: Theme.of(context).textTheme.titleMedium,
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  if (controller.selectedVariation.value.description != null &&
                      controller
                          .selectedVariation.value.description!.isNotEmpty)
                    ProductTitleText(
                      text: controller.selectedVariation.value.description!,
                      smallSize: true,
                      maxLines: 4,
                    )
                ],
              ),
            ),
          const Gap(TSizes.spaceBtwItems),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: product.productAttributes!
                .map(
                  (attribute) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SectionHeading(
                        title: attribute.name ?? '',
                        showActionButton: false,
                      ),
                      const Gap(TSizes.spaceBtwItems / 2),
                      Obx(
                        () => Wrap(
                          spacing: 8,
                          children: attribute.values!.map((value) {
                            final isSelected =
                                controller.selectedAttributes[attribute.name] ==
                                    value;

                            final available = controller
                                .getAttributesAvailabilityInVartiation(
                                    product.productVariations!, attribute.name!)
                                .contains(value);
                            return CustomChoiceChip(
                              label: value,
                              selected: isSelected,
                              onSelected: available
                                  ? (selected) {
                                      if (selected && available) {
                                        controller.onAttributeSelected(product,
                                            attribute.name ?? '', value);
                                      }
                                    }
                                  : null,
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
