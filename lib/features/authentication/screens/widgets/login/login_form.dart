import 'package:ecommerce/features/authentication/controllers/login/login_controller.dart';
import 'package:ecommerce/navigation_menu.dart';
import 'package:ecommerce/features/authentication/screens/login/forget_password.dart';
import 'package:ecommerce/features/authentication/screens/register/register.dart';
import 'package:ecommerce/utils/contants/sizes.dart';
import 'package:ecommerce/utils/contants/text_strings.dart';
import 'package:ecommerce/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            TextFormField(
              controller: controller.email,
              validator: (value) => TValidator.validateEmail(value),
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: TTexts.email,
              ),
            ),
            const Gap(TSizes.spaceBtwInputFields),
            Obx(
              () => TextFormField(
                obscureText: controller.hidePassword.value,
                controller: controller.password,
                validator: (value) =>
                    TValidator.validateIsEmptyText('Password', value),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Iconsax.password_check),
                  labelText: TTexts.password,
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.hidePassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye,
                    ),
                    onPressed: () => controller.hidePassword.value =
                        !controller.hidePassword.value,
                  ),
                ),
              ),
            ),
            const Gap(TSizes.spaceBtwInputFields / 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Remember me
                Row(children: [
                  Obx(
                    () => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: (value) {
                          controller.rememberMe.value =
                              !controller.rememberMe.value;
                        }),
                  ),
                  const Text(
                    TTexts.rememberMe,
                  ),
                ]),

                //Forget Password
                TextButton(
                  onPressed: () => Get.to(() => const ForgetPasswordScreen()),
                  child: const Text(
                    TTexts.forgetPassword,
                  ),
                )
              ],
            ),
            const Gap(TSizes.spaceBtwSections),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.loginWithEmailPassword(),
                  child: const Text(TTexts.signIn)),
            ),
            const Gap(TSizes.spaceBtwItems),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => const Register()),
                child: const Text(TTexts.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
