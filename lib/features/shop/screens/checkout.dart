import 'package:ecommerce/commons/widgets/appbar/appbar.dart';
import 'package:ecommerce/commons/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerce/commons/widgets/success_screen/success_screen.dart';
import 'package:ecommerce/features/shop/screens/widgets/cart/bulk_cart_items.dart';
import 'package:ecommerce/features/shop/screens/widgets/checkout/billing_address_section.dart';
import 'package:ecommerce/features/shop/screens/widgets/checkout/billing_amount_section.dart';
import 'package:ecommerce/features/shop/screens/widgets/checkout/billing_payment_section.dart';
import 'package:ecommerce/features/shop/screens/widgets/checkout/coupon_code_input.dart';
import 'package:ecommerce/navigation_menu.dart';
import 'package:ecommerce/utils/contants/colors.dart';
import 'package:ecommerce/utils/contants/image_strings.dart';
import 'package:ecommerce/utils/contants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text(
          'Checkout',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const BulkCartItems(
                shouldAddRemoveButton: false,
              ),
              const Gap(TSizes.spaceBtwSections),
              const CouponCodeInput(),
              const Gap(TSizes.spaceBtwSections),
              RoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(TSizes.md),
                backgroundColor: dark ? TColors.black : TColors.white,
                child: const Column(
                  children: [
                    BillingAmountSection(),
                    Gap(TSizes.spaceBtwItems),
                    Divider(),
                    Gap(TSizes.spaceBtwItems),
                    BillingPaymentSection(),
                    Gap(TSizes.spaceBtwItems),
                    Divider(),
                    Gap(TSizes.spaceBtwItems),
                    BillingAddressSection()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () => Get.to(
                  () => SuccessScreen(
                    image: TImages.successfulPaymentIcon,
                    title: 'Payment Success!',
                    subtitle: 'Your item will be shipped soon!',
                    onPressed: () => Get.offAll(() => const NavigationMenu()),
                  ),
                ),
            child: const Text('Checkout \$256')),
      ),
    );
  }
}
