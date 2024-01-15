import 'dart:async';

import 'package:ecommerce/commons/widgets/success_screen/success_screen.dart';
import 'package:ecommerce/data/repositories/authentication_repository/authentication_repository.dart';
import 'package:ecommerce/utils/contants/image_strings.dart';
import 'package:ecommerce/utils/contants/text_strings.dart';
import 'package:ecommerce/utils/popup/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class EmailVerificationController extends GetxController {
  static EmailVerificationController get instance => Get.find();

  final _auth = FirebaseAuth.instance;

  @override
  void onInit() {
    sendEmailVerification();
    setTimerOnAutoRedirect();
    super.onInit();
  }

  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.successSnackBar(
          title: 'Email sent!', message: 'Please check your registered email!');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
    }
  }

  setTimerOnAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await _auth.currentUser?.reload();
      final user = _auth.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() => SuccessScreen(
            image: TImages.succesfullyRegisteredAnimation,
            title: TTexts.yourAccountCreatedTitle,
            subtitle: TTexts.yourAccountCreatedSubTitle,
            onPressed: () =>
                AuthenticationRepository.instance.screenRedirect()));
      }
    });
  }

  checkEmailVerificationStatus() async {
    final currentUser = _auth.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(() => SuccessScreen(
          image: TImages.succesfullyRegisteredAnimation,
          title: TTexts.yourAccountCreatedTitle,
          subtitle: TTexts.yourAccountCreatedSubTitle,
          onPressed: () => AuthenticationRepository.instance.screenRedirect()));
    }
  }
}
