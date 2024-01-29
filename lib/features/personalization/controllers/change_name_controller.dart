import 'package:ecommerce/data/repositories/user_repository/user_repository.dart';
import 'package:ecommerce/features/personalization/controllers/user_controller.dart';
import 'package:ecommerce/features/personalization/screens/profile.dart';
import 'package:ecommerce/utils/contants/image_strings.dart';
import 'package:ecommerce/utils/helpers/network_manager.dart';
import 'package:ecommerce/utils/popup/full_screen_loader.dart';
import 'package:ecommerce/utils/popup/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeNameController extends GetxController {
  static ChangeNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  GlobalKey<FormState> changeNameFormKey = GlobalKey<FormState>();

  final userRepository = Get.put(UserRepository());

  @override
  void onInit() {
    super.onInit();
    initializeChangenameForm();
  }

  Future<void> initializeChangenameForm() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateName() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'Updating your name...', TImages.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (!changeNameFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      Map<String, dynamic> name = {
        "firstName": firstName.text.trim(),
        "lastName": lastName.text.trim()
      };
      await userRepository.updateSingleField(name);

      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      TFullScreenLoader.stopLoading();

      TLoaders.successSnackBar(
          title: 'Done!', message: 'You successfully updated your name!');

      Get.off(() => const ProfileScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();

      TLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
    }
  }
}
