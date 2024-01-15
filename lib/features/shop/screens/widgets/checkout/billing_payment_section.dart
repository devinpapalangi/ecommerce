import 'package:ecommerce/commons/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerce/commons/widgets/texts/section_heading.dart';
import 'package:ecommerce/utils/contants/colors.dart';
import 'package:ecommerce/utils/contants/image_strings.dart';
import 'package:ecommerce/utils/contants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BillingPaymentSection extends StatelessWidget {
  const BillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        const SectionHeading(
          title: 'Payment Method',
          buttonTitle: 'Change',
        ),
        const Gap(TSizes.spaceBtwItems / 2),
        Row(
          children: [
            RoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: dark ? TColors.light : TColors.white,
              padding: const EdgeInsets.all(TSizes.sm),
              child: const Image(
                image: AssetImage(TImages.paypal),
                fit: BoxFit.contain,
              ),
            ),
            const Gap(TSizes.spaceBtwItems / 2),
            Text(
              'Paypal',
              style: Theme.of(context).textTheme.bodyLarge,
            )
          ],
        )
      ],
    );
  }
}
