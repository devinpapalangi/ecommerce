import 'package:ecommerce/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:ecommerce/utils/contants/colors.dart';
import 'package:ecommerce/utils/contants/sizes.dart';
import 'package:ecommerce/utils/device/device_utility.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPageIndicator extends StatelessWidget {
  const OnboardingPageIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = THelperFunctions.isDarkMode(context);
    return Positioned(
      bottom: TDeviceUtils.getBottomNavigationBarHeight() + 25,
      left: TSizes.defaultSpace,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        count: 3,
        onDotClicked: controller.dotNavigationClick,
        effect: ExpandingDotsEffect(
            activeDotColor: dark ? TColors.light : TColors.dark, dotWidth: 10),
      ),
    );
  }
}
