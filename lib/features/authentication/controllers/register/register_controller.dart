import 'package:ecommerce/data/repositories/authentication_repository/authentication_repository.dart';
import 'package:ecommerce/data/repositories/user_repository/user_repository.dart';
import 'package:ecommerce/features/authentication/models/user_model.dart';
import 'package:ecommerce/features/authentication/screens/register/verify_email.dart';
import 'package:ecommerce/utils/contants/image_strings.dart';
import 'package:ecommerce/utils/helpers/network_manager.dart';
import 'package:ecommerce/utils/popup/full_screen_loader.dart';
import 'package:ecommerce/utils/popup/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  static RegisterController get instance => Get.find();

  //Variables
  final hidePassword = true.obs;
  final privacyPolicy = false.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final firstName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  void register() async {
    try {
      //Loading
      TFullScreenLoader.openLoadingDialog(
          'We are processing your information...', TImages.docerAnimation);

      //Check Internet
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (!registerFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
            title: 'Accept Policy',
            message:
                'You must accept our privacy policy and terms of use before registering!');
        return;
      }

      final UserCredential userCredential =
          await AuthenticationRepository.instance.registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      final user = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(user);

      TFullScreenLoader.stopLoading();

      TLoaders.successSnackBar(
          title: 'Congratulations!',
          message: 'Your account has been created! Verify email to continue!');

      Get.to(() => VerifyEmailScreen(
            email: user.email,
          ));
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
    }
  }
}
