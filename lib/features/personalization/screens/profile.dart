import 'package:ecommerce/commons/widgets/appbar/appbar.dart';
import 'package:ecommerce/commons/widgets/images/circular_images.dart';
import 'package:ecommerce/commons/widgets/shimmer_effect/shimmer_effect.dart';
import 'package:ecommerce/commons/widgets/texts/section_heading.dart';
import 'package:ecommerce/features/personalization/controllers/user_controller.dart';
import 'package:ecommerce/features/personalization/screens/change_name.dart';
import 'package:ecommerce/features/personalization/screens/widgets/profile/profile_menu.dart';
import 'package:ecommerce/utils/contants/image_strings.dart';
import 'package:ecommerce/utils/contants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text(
          'Profile',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image =
                          networkImage.isEmpty ? TImages.user : networkImage;

                      return controller.imageUploading.value
                          ? const TShimmerEffect(
                              width: 80,
                              height: 80,
                              radius: 80,
                            )
                          : CircularImage(
                              image: image,
                              isNetworkImage: networkImage.isNotEmpty,
                            );
                    }),
                    TextButton(
                      onPressed: () => controller.uploadUserProfileImage(),
                      child: const Text('Change profile picture'),
                    )
                  ],
                ),
              ),
              const Gap(TSizes.spaceBtwSections / 2),
              const Divider(),
              const Gap(TSizes.spaceBtwItems),
              const SectionHeading(
                title: 'Profile Information',
                showActionButton: false,
              ),
              const Gap(TSizes.spaceBtwItems),
              Obx(
                () => ProfileMenu(
                  onPressed: () => Get.to(() => const ChangeNameScreen()),
                  title: 'Name',
                  value: controller.user.value.fullName,
                ),
              ),
              Obx(
                () => ProfileMenu(
                  onPressed: () {},
                  title: 'Username',
                  value: controller.user.value.username,
                ),
              ),
              const Divider(),
              const SectionHeading(
                title: 'Personal Information',
                showActionButton: false,
              ),
              const Gap(TSizes.spaceBtwItems),
              Obx(
                () => ProfileMenu(
                  onPressed: () {},
                  title: 'UserID',
                  value: controller.user.value.id,
                ),
              ),
              Obx(
                () => ProfileMenu(
                  onPressed: () {},
                  title: 'Email',
                  value: controller.user.value.email,
                ),
              ),
              Obx(
                () => ProfileMenu(
                  onPressed: () {},
                  title: 'Phone Number',
                  value: controller.user.value.phoneNumber,
                ),
              ),
              ProfileMenu(
                onPressed: () {},
                title: 'Gender',
                value: 'Male',
              ),
              ProfileMenu(
                onPressed: () {},
                title: 'Date Of Birth',
                value: '10 Oct, 1999',
              ),
              const Gap(TSizes.spaceBtwSections),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed: () => controller.deleteAccountWaringPopUp(),
                    child: const Text(
                      'Close Account',
                      style: TextStyle(color: Colors.red),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
