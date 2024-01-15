import 'package:ecommerce/features/shop/screens/home.dart';
import 'package:ecommerce/features/personalization/screens/settings.dart';
import 'package:ecommerce/features/shop/screens/store.dart';
import 'package:ecommerce/features/shop/screens/wishlist.dart';
import 'package:ecommerce/utils/contants/colors.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          backgroundColor: dark ? TColors.black : TColors.white,
          indicatorColor: dark
              ? TColors.white.withOpacity(0.1)
              : TColors.black.withOpacity(0.1),
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
            NavigationDestination(icon: Icon(Iconsax.heart), label: 'Wishlist'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    const HomeScreen(),
    const StoreScreen(),
    const Wishlist(),
    const SettingsScreen()
  ];
}
