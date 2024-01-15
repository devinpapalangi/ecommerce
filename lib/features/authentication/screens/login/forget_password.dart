import 'package:ecommerce/features/authentication/screens/login/reset_password.dart';
import 'package:ecommerce/utils/contants/sizes.dart';
import 'package:ecommerce/utils/contants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                TTexts.forgetPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const Gap(TSizes.spaceBtwItems),
              Text(
                TTexts.forgetPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const Gap(TSizes.spaceBtwSections),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: TTexts.email,
                  prefixIcon: Icon(Iconsax.direct_right),
                ),
              ),
              const Gap(TSizes.spaceBtwSections),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.off(() => const ResetPassword()),
                  child: const Text(TTexts.submit),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
