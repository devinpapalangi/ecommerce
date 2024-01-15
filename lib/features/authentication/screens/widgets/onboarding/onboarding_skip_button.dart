import 'package:ecommerce/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:ecommerce/utils/contants/sizes.dart';
import 'package:ecommerce/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class OnBoardingSkipButton extends StatelessWidget {
  const OnBoardingSkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: TDeviceUtils.getAppBarHeight(),
      right: TSizes.defaultSpace,
      child: TextButton(
        onPressed: () => OnBoardingController.instance.skipPage(),
        child: const Text('Skip'),
      ),
    );
  }
}
