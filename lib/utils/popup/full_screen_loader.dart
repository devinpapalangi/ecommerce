import 'package:ecommerce/utils/contants/colors.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:ecommerce/utils/popup/animation_loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class TFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    final dark = THelperFunctions.isDarkMode(Get.context!);
    showDialog(
      barrierDismissible: false,
      context: Get.overlayContext!,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: dark ? TColors.dark : TColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const Gap(250),
              TAnimationLoaderWidget(
                text: text,
                animation: animation,
              )
            ],
          ),
        ),
      ),
    );
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
