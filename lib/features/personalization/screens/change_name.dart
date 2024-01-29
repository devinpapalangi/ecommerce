import 'package:ecommerce/commons/widgets/appbar/appbar.dart';
import 'package:ecommerce/features/personalization/controllers/change_name_controller.dart';
import 'package:ecommerce/utils/contants/sizes.dart';
import 'package:ecommerce/utils/contants/text_strings.dart';
import 'package:ecommerce/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ChangeNameScreen extends StatelessWidget {
  const ChangeNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChangeNameController());
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text(
          'Change Name',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Use your real name for easy verification. This name will appear on several pages!',
              ),
              const Gap(TSizes.spaceBtwSections),
              Form(
                key: controller.changeNameFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.firstName,
                      validator: (value) => TValidator.validateFirstName(value),
                      expands: false,
                      decoration: const InputDecoration(
                          labelText: TTexts.firstName,
                          prefixIcon: Icon(Iconsax.user)),
                    ),
                    const Gap(TSizes.spaceBtwInputFields),
                    TextFormField(
                      controller: controller.lastName,
                      validator: (value) => TValidator.validateLastName(value),
                      expands: false,
                      decoration: const InputDecoration(
                          labelText: TTexts.lastName,
                          prefixIcon: Icon(Iconsax.user)),
                    ),
                  ],
                ),
              ),
              const Gap(TSizes.spaceBtwSections),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: const Text('Save'),
                  onPressed: () => controller.updateName(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
