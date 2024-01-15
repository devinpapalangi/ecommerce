import 'package:ecommerce/utils/contants/colors.dart';
import 'package:ecommerce/utils/contants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CircularImage extends StatelessWidget {
  const CircularImage(
      {super.key,
      this.fit = BoxFit.contain,
      required this.image,
      this.isNetworkImage = false,
      this.overlayColor,
      this.backgroundColor,
      this.width = 56,
      this.height = 56,
      this.padding = TSizes.sm});

  final BoxFit fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor != null
            ? dark
                ? TColors.black
                : TColors.white
            : Colors.transparent,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Image(
          fit: fit,
          image: isNetworkImage
              ? NetworkImage(image)
              : AssetImage(image) as ImageProvider,
          color: overlayColor),
    );
  }
}
