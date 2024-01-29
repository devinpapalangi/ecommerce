import 'package:ecommerce/data/repositories/authentication_repository/authentication_repository.dart';
import 'package:ecommerce/features/authentication/screens/login/reset_password.dart';
import 'package:ecommerce/utils/contants/image_strings.dart';
import 'package:ecommerce/utils/helpers/network_manager.dart';
import 'package:ecommerce/utils/popup/full_screen_loader.dart';
import 'package:ecommerce/utils/popup/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  final authRepository = Get.put(AuthenticationRepository());

  sendPasswordResetEmail() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'Sending the email to you...', TImages.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (!forgetPasswordFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      await authRepository.sendPasswordResetEmail(email.text.trim());

      TFullScreenLoader.stopLoading();

      TLoaders.successSnackBar(
          title: 'Email send!',
          message: 'Email Link sent to Reset your Password'.tr);

      Get.to(() => ResetPassword(
            email: email.text,
          ));
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
    }
  }

  resendPasswordResetEmail() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'Sending the email to you...', TImages.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      await authRepository.sendPasswordResetEmail(email.text.trim());

      TFullScreenLoader.stopLoading();

      TLoaders.successSnackBar(
          title: 'Email send!',
          message: 'Email Link sent to Reset your Password'.tr);

      Get.to(() => ResetPassword(
            email: email.text,
          ));
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
    }
  }
}
