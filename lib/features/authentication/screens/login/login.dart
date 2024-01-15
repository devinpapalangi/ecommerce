import 'package:ecommerce/commons/styles/spacing_styles.dart';
import 'package:ecommerce/commons/widgets/login_signup/social_button.dart';
import 'package:ecommerce/features/authentication/screens/widgets/login/login_form.dart';
import 'package:ecommerce/features/authentication/screens/widgets/login/login_header.dart';

import 'package:ecommerce/commons/widgets/login_signup/form_divider.dart';
import 'package:ecommerce/utils/contants/sizes.dart';
import 'package:ecommerce/utils/contants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyles.paddingWithAppbarHeight,
          child: Column(
            children: [
              LoginHeader(),
              LoginForm(),
              FormDivider(
                dividerText: TTexts.orSignInWith,
              ),
              Gap(TSizes.spaceBtwSections),
              SocialButton()
            ],
          ),
        ),
      ),
    );
  }
}
