import 'package:ecommerce/commons/widgets/appbar/appbar.dart';
import 'package:ecommerce/commons/widgets/images/circular_images.dart';
import 'package:ecommerce/commons/widgets/texts/section_heading.dart';
import 'package:ecommerce/features/personalization/screens/widgets/profile/profile_menu.dart';
import 'package:ecommerce/utils/contants/image_strings.dart';
import 'package:ecommerce/utils/contants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    const CircularImage(image: TImages.user),
                    TextButton(
                      onPressed: () {},
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
              ProfileMenu(
                onPressed: () {},
                title: 'Name',
                value: 'Coding With T',
              ),
              ProfileMenu(
                onPressed: () {},
                title: 'Username',
                value: 'Coding With T',
              ),
              const Divider(),
              const SectionHeading(
                title: 'Personal Information',
                showActionButton: false,
              ),
              const Gap(TSizes.spaceBtwItems),
              ProfileMenu(
                onPressed: () {},
                title: 'User ID',
                value: '483821',
                icon: Iconsax.copy,
              ),
              ProfileMenu(
                onPressed: () {},
                title: 'E-mail',
                value: 'coding_with_t',
              ),
              ProfileMenu(
                onPressed: () {},
                title: 'User ID',
                value: '483821',
              ),
              ProfileMenu(
                onPressed: () {},
                title: 'Phone Number',
                value: '+62 81287437859',
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
                    onPressed: () {},
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
