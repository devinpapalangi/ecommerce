import 'package:get/get.dart';

class TSizing {
  TSizing._();

  static getScreenHeight() {
    return Get.height;
  }

  static getScreenWidth() {
    return Get.width;
  }

  static getHeight(double pixels) {
    double x = getScreenHeight() / pixels;

    return getScreenHeight() / x;
  }

  static getWidth(double pixels) {
    double y = getScreenWidth() / pixels;

    return getScreenWidth() / y;
  }
}
