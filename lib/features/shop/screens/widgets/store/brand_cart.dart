import 'package:ecommerce/commons/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerce/commons/widgets/image_text_widget/brand_title_with_icon.dart';
import 'package:ecommerce/commons/widgets/images/circular_images.dart';
import 'package:ecommerce/utils/contants/colors.dart';
import 'package:ecommerce/utils/contants/enums.dart';
import 'package:ecommerce/utils/contants/image_strings.dart';
import 'package:ecommerce/utils/contants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BrandCard extends StatelessWidget {
  const BrandCard({
    super.key,
    required this.showBorder,
    this.onTap,
  });

  final bool showBorder;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: RoundedContainer(
        padding: const EdgeInsets.all(TSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            Flexible(
              child: CircularImage(
                image: TImages.nikeLogo,
                fit: BoxFit.contain,
                overlayColor: dark ? TColors.white : TColors.black,
              ),
            ),
            const Gap(TSizes.spaceBtwItems / 2),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BrandTitleWithIcon(
                    title: 'Nike',
                    maxLines: 1,
                    textSizes: TextSizes.large,
                  ),
                  Text(
                    '256 products',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
