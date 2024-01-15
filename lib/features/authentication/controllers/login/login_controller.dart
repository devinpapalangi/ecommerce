import 'package:ecommerce/data/repositories/authentication_repository/authentication_repository.dart';
import 'package:ecommerce/features/authentication/screens/login/login.dart';
import 'package:ecommerce/utils/contants/image_strings.dart';
import 'package:ecommerce/utils/helpers/network_manager.dart';
import 'package:ecommerce/utils/popup/full_screen_loader.dart';
import 'package:ecommerce/utils/popup/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final localStorage = GetStorage();
  final hidePassword = true.obs;
  final rememberMe = false.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL');
    password.text = localStorage.read('REMEMBER_ME_PASSWORD');
    super.onInit();
  }

  void loginWithEmailPassword() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'Logging you in...', TImages.docerAnimation);

      //Check Internet
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      final UserCredential userCredential = await AuthenticationRepository
          .instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      TFullScreenLoader.stopLoading();

      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();

      TLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
    }
  }

  void loginWithGoogle() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'Logging you in...', TImages.docerAnimation);

      //Check Internet
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      final UserCredential userCredential =
          await AuthenticationRepository.instance.loginWithGoogle();

      TFullScreenLoader.stopLoading();

      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();

      TLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
    }
  }
}
