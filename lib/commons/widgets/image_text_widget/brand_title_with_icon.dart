import 'package:ecommerce/commons/widgets/texts/brand_title.dart';
import 'package:ecommerce/utils/contants/colors.dart';
import 'package:ecommerce/utils/contants/enums.dart';
import 'package:ecommerce/utils/contants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

class BrandTitleWithIcon extends StatelessWidget {
  const BrandTitleWithIcon(
      {super.key,
      required this.title,
      this.maxLines = 1,
      this.textColor,
      this.iconColor = TColors.primary,
      this.textAlign,
      this.textSizes = TextSizes.small});

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes textSizes;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BrandTitleText(
          title: title,
          maxLines: maxLines,
          color: textColor,
          brandTextSizes: textSizes,
        ),
        const Gap(TSizes.xs),
        Icon(
          Iconsax.verify5,
          color: iconColor,
          size: TSizes.iconXs,
        )
      ],
    );
  }
}
