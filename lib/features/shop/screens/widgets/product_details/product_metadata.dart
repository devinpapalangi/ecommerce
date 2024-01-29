import 'package:ecommerce/commons/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerce/commons/widgets/image_text_widget/brand_title_with_icon.dart';
import 'package:ecommerce/commons/widgets/images/circular_images.dart';
import 'package:ecommerce/commons/widgets/texts/product_price.dart';
import 'package:ecommerce/commons/widgets/texts/product_title.dart';
import 'package:ecommerce/features/shop/controllers/product/products_controller.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/utils/contants/colors.dart';
import 'package:ecommerce/utils/contants/enums.dart';
import 'package:ecommerce/utils/contants/image_strings.dart';
import 'package:ecommerce/utils/contants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ProductMetadata extends StatelessWidget {
  const ProductMetadata({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(ProductController());
    final salePercentage =
        controller.calculateSalePrecentage(product.price, product.salePrice);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            RoundedContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                horizontal: TSizes.sm,
                vertical: TSizes.xs,
              ),
              child: Text(
                '$salePercentage%',
                style: Theme.of(context).textTheme.labelLarge!.apply(
                      color: TColors.black,
                    ),
              ),
            ),
            const Gap(TSizes.spaceBtwItems),
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              Text(
                '\$${product.price}',
                style: Theme.of(context).textTheme.titleSmall!.apply(
                      decoration: TextDecoration.lineThrough,
                    ),
              ),
            const Gap(TSizes.spaceBtwItems),
            ProductPriceText(
              price: controller.getProductPrice(product),
              isLarge: true,
            )
          ],
        ),
        const Gap(TSizes.spaceBtwItems / 1.5),
        ProductTitleText(text: product.title),
        const Gap(TSizes.spaceBtwItems / 1.5),
        Row(
          children: [
            const ProductTitleText(text: 'Status'),
            const Gap(TSizes.spaceBtwItems),
            Text(
              controller.getProductStocStatus(product.stock),
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        const Gap(TSizes.spaceBtwItems / 1.5),
        Row(
          children: [
            CircularImage(
              isNetworkImage: true,
              image: product.brand!.image,
              width: 40,
              height: 40,
              overlayColor: dark ? TColors.white : TColors.black,
            ),
            BrandTitleWithIcon(
              title: product.brand!.name,
              textSizes: TextSizes.medium,
            ),
          ],
        ),
        const Gap(TSizes.spaceBtwItems / 1.5),
      ],
    );
  }
}
