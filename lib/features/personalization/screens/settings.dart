import 'package:ecommerce/commons/widgets/appbar/appbar.dart';
import 'package:ecommerce/commons/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:ecommerce/commons/widgets/texts/section_heading.dart';
import 'package:ecommerce/commons/widgets/tiles/settings_menu_tiles.dart';
import 'package:ecommerce/commons/widgets/tiles/user_profile_tiles.dart';
import 'package:ecommerce/data/repositories/authentication_repository/authentication_repository.dart';
import 'package:ecommerce/features/authentication/screens/login/login.dart';
import 'package:ecommerce/features/personalization/screens/adresses.dart';
import 'package:ecommerce/features/shop/screens/cart.dart';
import 'package:ecommerce/features/shop/screens/order.dart';
import 'package:ecommerce/utils/contants/colors.dart';
import 'package:ecommerce/utils/contants/sizes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  //Appbar
                  CustomAppBar(
                    title: Text(
                      'Account',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: TColors.white),
                    ),
                  ),
                  const Gap(TSizes.spaceBtwSections),

                  const UserProfileTile(),
                  const Gap(TSizes.spaceBtwSections),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const SectionHeading(
                    title: 'Account Settings',
                    showActionButton: false,
                  ),
                  const Gap(TSizes.spaceBtwItems),
                  SettingsMenuTiles(
                    icon: Iconsax.safe_home,
                    title: 'My Addresses',
                    subtitle: 'Set shopping delivery address',
                    onTap: () => Get.to(() => const AddressScreen()),
                  ),
                  SettingsMenuTiles(
                    icon: Iconsax.shopping_cart,
                    title: 'My Cart',
                    subtitle: 'Add, remove products and move to checkout',
                    onTap: () => Get.to(() => const CartScreen()),
                  ),
                  SettingsMenuTiles(
                    icon: Iconsax.bag_tick,
                    title: 'My Orders',
                    subtitle: 'In progress and completed orders',
                    onTap: () => Get.to(() => const OrderScreen()),
                  ),
                  const SettingsMenuTiles(
                    icon: Iconsax.bank,
                    title: 'Bank Account',
                    subtitle: 'Withdraw balance to registered bank account',
                  ),
                  const SettingsMenuTiles(
                    icon: Iconsax.discount_shape,
                    title: 'Coupons',
                    subtitle: 'All discounted coupons',
                  ),
                  const SettingsMenuTiles(
                    icon: Iconsax.notification,
                    title: 'Notifications',
                    subtitle: 'Set any kind of notifications',
                  ),
                  const SettingsMenuTiles(
                    icon: Iconsax.security_card,
                    title: 'Privacy',
                    subtitle: 'Manage data usage and connected accounts',
                  ),
                  const Gap(TSizes.spaceBtwSections),
                  const SectionHeading(
                    title: 'Settings',
                    showActionButton: false,
                  ),
                  const Gap(TSizes.spaceBtwItems),
                  const SettingsMenuTiles(
                    icon: Iconsax.document_upload,
                    title: 'Load Data',
                    subtitle: 'Upload data to your Cloud Firebase',
                  ),
                  SettingsMenuTiles(
                    icon: Iconsax.location,
                    title: 'Geolocation',
                    subtitle: 'Set recomendation based on location',
                    trailing: Switch(
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),
                  SettingsMenuTiles(
                    icon: Iconsax.security_user,
                    title: 'Safe Mode',
                    subtitle: 'Search result is safe for all age',
                    trailing: Switch(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ),
                  SettingsMenuTiles(
                    icon: Iconsax.image,
                    title: 'HD Image Quality',
                    subtitle: 'Set image quality to be seen',
                    trailing: Switch(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ),
                  const Gap(TSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                        onPressed: () {
                          FirebaseAuth.instance.signOut();
                          AuthenticationRepository.instance.screenRedirect();
                        },
                        child: const Text(
                          'Logout',
                          style: TextStyle(color: Colors.red),
                        )),
                  ),
                  const Gap(TSizes.spaceBtwSections * 2.5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
