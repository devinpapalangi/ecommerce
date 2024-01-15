import 'package:ecommerce/commons/widgets/appbar/appbar.dart';
import 'package:ecommerce/features/personalization/screens/add_new_address.dart';
import 'package:ecommerce/features/personalization/screens/widgets/addresses/single_address.dart';
import 'package:ecommerce/utils/contants/colors.dart';
import 'package:ecommerce/utils/contants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: TColors.primary,
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        child: const Icon(
          Iconsax.add,
          color: TColors.white,
        ),
      ),
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text(
          'Addresses',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              SingleAddress(selectedAddress: true),
              SingleAddress(selectedAddress: false),
              SingleAddress(selectedAddress: false),
            ],
          ),
        ),
      ),
    );
  }
}
