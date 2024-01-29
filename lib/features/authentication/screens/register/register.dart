import 'package:ecommerce/commons/widgets/login_signup/form_divider.dart';
import 'package:ecommerce/commons/widgets/login_signup/social_button.dart';
import 'package:ecommerce/features/authentication/screens/widgets/register/register_form.dart';
import 'package:ecommerce/utils/contants/colors.dart';
import 'package:ecommerce/utils/contants/sizes.dart';
import 'package:ecommerce/utils/contants/text_strings.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
        onPressed: () => Get.back(),
        icon: Icon(
          Iconsax.arrow_left,
          color: dark ? TColors.white : TColors.darkGrey,
        ),
      )),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              TTexts.signupTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const Gap(TSizes.spaceBtwSections),
            const RegisterForm(),
            const Gap(TSizes.spaceBtwSections),
            FormDivider(dividerText: TTexts.orSignUpWith.capitalize!),
            const Gap(TSizes.spaceBtwItems),
            const SocialButton()
          ],
        ),
      ),
    );
  }
}
