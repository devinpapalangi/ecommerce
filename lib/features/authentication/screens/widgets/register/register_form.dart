import 'package:ecommerce/features/authentication/controllers/register/register_controller.dart';
import 'package:ecommerce/features/authentication/screens/widgets/register/terms_and_condition_checkbox.dart';
import 'package:ecommerce/utils/contants/sizes.dart';
import 'package:ecommerce/utils/contants/text_strings.dart';
import 'package:ecommerce/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());
    return Form(
      key: controller.registerFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) => TValidator.validateFirstName(value),
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: TTexts.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              const Gap(TSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) => TValidator.validateLastName(value),
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: TTexts.lastName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          const Gap(TSizes.spaceBtwInputFields),
          TextFormField(
            controller: controller.username,
            validator: (value) => TValidator.valiedateUsername(value),
            decoration: const InputDecoration(
                labelText: TTexts.username,
                prefixIcon: Icon(Iconsax.user_edit)),
          ),
          const Gap(TSizes.spaceBtwInputFields),
          TextFormField(
            controller: controller.email,
            validator: (value) => TValidator.validateEmail(value),
            decoration: const InputDecoration(
                labelText: TTexts.email, prefixIcon: Icon(Iconsax.direct)),
          ),
          const Gap(TSizes.spaceBtwInputFields),
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => TValidator.validatePhoneNumber(value),
            decoration: const InputDecoration(
                labelText: TTexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
          ),
          const Gap(TSizes.spaceBtwInputFields),
          Obx(
            () => TextFormField(
              controller: controller.password,
              obscureText: controller.hidePassword.value,
              validator: (value) => TValidator.validatePassword(value),
              decoration: InputDecoration(
                  labelText: TTexts.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    icon: Icon(controller.hidePassword.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye),
                    onPressed: () => controller.hidePassword.value =
                        !controller.hidePassword.value,
                  )),
            ),
          ),
          const Gap(TSizes.spaceBtwSections),
          const TermsAndConditionCheckbox(),
          const Gap(TSizes.spaceBtwSections),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.register(),
              child: const Text(TTexts.createAccount),
            ),
          )
        ],
      ),
    );
  }
}
