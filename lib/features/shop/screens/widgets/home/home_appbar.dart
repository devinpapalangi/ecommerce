import 'package:ecommerce/commons/widgets/appbar/appbar.dart';
import 'package:ecommerce/commons/widgets/products/cart/cart_menu_icons.dart';
import 'package:ecommerce/features/shop/screens/cart.dart';
import 'package:ecommerce/utils/contants/colors.dart';
import 'package:ecommerce/utils/contants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TTexts.homeAppbarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: TColors.grey),
          ),
          Text(
            TTexts.homeAppbarSubTitle,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: TColors.white),
          ),
        ],
      ),
      actions: [
        CartCounterIcon(
          onPressed: () => Get.to(() => const CartScreen()),
        )
      ],
    );
  }
}
