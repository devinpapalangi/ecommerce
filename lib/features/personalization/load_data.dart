import 'package:ecommerce/commons/widgets/appbar/appbar.dart';
import 'package:ecommerce/commons/widgets/texts/section_heading.dart';
import 'package:ecommerce/commons/widgets/tiles/settings_menu_tiles.dart';
import 'package:ecommerce/features/personalization/controllers/load_data_controller.dart';
import 'package:ecommerce/utils/contants/colors.dart';
import 'package:ecommerce/utils/contants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LoadDataScreen extends StatelessWidget {
  const LoadDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoadDataController());
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text(
          'Load Data',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const SectionHeading(
                title: 'Main Record',
                showActionButton: false,
              ),
              SettingsMenuTiles(
                icon: Iconsax.category,
                title: 'Load Categories',
                trailing: const Icon(
                  Iconsax.arrow_up_1,
                  color: TColors.primary,
                ),
                subtitle: 'Upload dummy categories data',
                onTap: () => controller.loadCategories(),
              ),
              SettingsMenuTiles(
                icon: Iconsax.image,
                title: 'Load Banner',
                subtitle: 'Upload dummy banners data',
                trailing: const Icon(
                  Iconsax.arrow_up_1,
                  color: TColors.primary,
                ),
                onTap: () => controller.loadBanners(),
              ),
              SettingsMenuTiles(
                icon: Iconsax.shop,
                title: 'Load Brands',
                trailing: const Icon(
                  Iconsax.arrow_up_1,
                  color: TColors.primary,
                ),
                subtitle: 'Upload dummy brands data',
                onTap: () => controller.loadBrands(),
              ),
              SettingsMenuTiles(
                icon: Iconsax.shopping_cart,
                title: 'Load Products',
                trailing: const Icon(
                  Iconsax.arrow_up_1,
                  color: TColors.primary,
                ),
                subtitle: 'Upload dummy products data',
                onTap: () => controller.loadProducts(),
              ),
              const Gap(TSizes.spaceBtwSections),
              const SectionHeading(
                title: 'Relationships',
                showActionButton: false,
              ),
              Text(
                'Make sure you have already uploaded all the content above',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              SettingsMenuTiles(
                icon: Iconsax.link,
                title: 'Upload Brands & Categories Relation',
                trailing: const Icon(
                  Iconsax.arrow_up_1,
                  color: TColors.primary,
                ),
                subtitle: 'Upload dummy brands and categories with relation',
                onTap: () => controller.loadBrandCategory(),
              ),
              SettingsMenuTiles(
                icon: Iconsax.link,
                title: 'Upload Product & Categories Relation',
                trailing: const Icon(
                  Iconsax.arrow_up_1,
                  color: TColors.primary,
                ),
                subtitle: 'Upload dummy product and categories with relation',
                onTap: () => controller.loadProductCategory(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
