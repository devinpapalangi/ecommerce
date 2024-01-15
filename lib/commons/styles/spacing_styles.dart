import 'package:ecommerce/utils/contants/sizes.dart';
import 'package:flutter/material.dart';

class TSpacingStyles {
  TSpacingStyles._();

  static const EdgeInsetsGeometry paddingWithAppbarHeight = EdgeInsets.only(
      top: TSizes.appBarHeight,
      left: TSizes.defaultSpace,
      bottom: TSizes.defaultSpace,
      right: TSizes.defaultSpace);
}
