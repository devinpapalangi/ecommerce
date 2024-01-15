import 'package:ecommerce/commons/styles/spacing_styles.dart';
import 'package:ecommerce/utils/contants/sizes.dart';
import 'package:ecommerce/utils/contants/text_strings.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.onPressed});
  final String image, title, subtitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyles.paddingWithAppbarHeight,
          child: Column(children: [
            //Image
            Lottie.asset(
              image,
              width: THelperFunctions.screenWidth() * 0.6,
            ),
            const Gap(TSizes.spaceBtwSections),

            //Title and Subtitle
            Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const Gap(TSizes.spaceBtwItems),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
            const Gap(TSizes.spaceBtwSections),

            //Button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onPressed,
                  child: const Text(TTexts.tContinue),
                ))
          ]),
        ),
      ),
    );
  }
}
