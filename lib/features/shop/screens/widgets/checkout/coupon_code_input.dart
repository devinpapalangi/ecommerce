import 'package:ecommerce/commons/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerce/utils/contants/colors.dart';
import 'package:ecommerce/utils/contants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CouponCodeInput extends StatelessWidget {
  const CouponCodeInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return RoundedContainer(
      showBorder: true,
      backgroundColor: dark ? TColors.dark : TColors.white,
      padding: const EdgeInsets.symmetric(vertical: TSizes.sm)
          .copyWith(right: TSizes.sm, left: TSizes.md),
      child: Row(children: [
        Flexible(
          child: TextFormField(
            decoration: const InputDecoration(
              hintText: 'Have a promo code? Enter it here',
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            ),
          ),
        ),
        SizedBox(
          width: 80,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              foregroundColor: dark
                  ? TColors.white.withOpacity(0.5)
                  : TColors.dark.withOpacity(0.5),
              backgroundColor: Colors.grey.withOpacity(0.2),
              side: BorderSide(
                color: Colors.grey.withOpacity(0.1),
              ),
            ),
            child: const Text('Apply'),
          ),
        )
      ]),
    );
  }
}
