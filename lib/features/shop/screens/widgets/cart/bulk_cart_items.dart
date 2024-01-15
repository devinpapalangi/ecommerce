import 'package:ecommerce/commons/widgets/texts/product_price.dart';
import 'package:ecommerce/features/shop/screens/widgets/cart/cart_item.dart';
import 'package:ecommerce/features/shop/screens/widgets/cart/product_quantity_add_remove.dart';
import 'package:ecommerce/utils/contants/image_strings.dart';
import 'package:ecommerce/utils/contants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BulkCartItems extends StatelessWidget {
  const BulkCartItems({
    super.key,
    this.shouldAddRemoveButton = true,
  });

  final bool shouldAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (_, index) => Column(
              children: [
                const CartItem(
                  image: TImages.productImage1,
                  productName: 'Nike Air Max',
                  color: 'Green',
                  size: 'UK 08',
                  brand: 'Nike',
                ),
                if (shouldAddRemoveButton) const Gap(TSizes.spaceBtwSections),
                if (shouldAddRemoveButton)
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 70,
                          ),
                          ProductQuantityWithAddAndRemove(),
                        ],
                      ),
                      ProductPriceText(price: '355')
                    ],
                  )
              ],
            ),
        separatorBuilder: (_, __) => const Gap(TSizes.spaceBtwSections),
        itemCount: 4);
  }
}
