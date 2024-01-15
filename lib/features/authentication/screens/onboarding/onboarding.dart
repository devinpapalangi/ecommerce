import 'package:ecommerce/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:ecommerce/features/authentication/screens/widgets/onboarding/onboarding_next_button.dart';
import 'package:ecommerce/features/authentication/screens/widgets/onboarding/onboarding_page.dart';
import 'package:ecommerce/features/authentication/screens/widgets/onboarding/onboarding_page_indicator.dart';
import 'package:ecommerce/features/authentication/screens/widgets/onboarding/onboarding_skip_button.dart';
import 'package:ecommerce/utils/contants/image_strings.dart';
import 'package:ecommerce/utils/contants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          ///The page
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: TImages.onBoardingImage1,
                title: TTexts.onBoardingTitle1,
                subtitle: TTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage2,
                title: TTexts.onBoardingTitle2,
                subtitle: TTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage3,
                title: TTexts.onBoardingTitle3,
                subtitle: TTexts.onBoardingSubTitle3,
              ),
            ],
          ),

          ///Skip Button
          const OnBoardingSkipButton(),

          ///Page Indicator
          const OnboardingPageIndicator(),

          //Circular Button
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}
