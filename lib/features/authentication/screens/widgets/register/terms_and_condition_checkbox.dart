import 'package:ecommerce/features/authentication/controllers/register/register_controller.dart';
import 'package:ecommerce/utils/contants/colors.dart';
import 'package:ecommerce/utils/contants/sizes.dart';
import 'package:ecommerce/utils/contants/text_strings.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class TermsAndConditionCheckbox extends StatelessWidget {
  const TermsAndConditionCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = RegisterController.instance;
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(
            () => Checkbox(
              value: controller.privacyPolicy.value,
              onChanged: (value) {
                controller.privacyPolicy.value = value!;
              },
            ),
          ),
        ),
        const Gap(TSizes.spaceBtwItems),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '${TTexts.iAgreeTo} ',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              TextSpan(
                text: TTexts.privacyPolicy,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: dark ? TColors.white : TColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? TColors.white : TColors.primary),
              ),
              TextSpan(
                text: ' ${TTexts.and} ',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              TextSpan(
                text: TTexts.termsOfUse,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: dark ? TColors.white : TColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? TColors.white : TColors.primary),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
