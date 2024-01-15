import 'package:ecommerce/utils/contants/colors.dart';
import 'package:ecommerce/utils/contants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

class TAnimationLoaderWidget extends StatelessWidget {
  const TAnimationLoaderWidget({
    super.key,
    required this.text,
    required this.animation,
    this.showAction = false,
    this.actionText,
    this.onActionPressed,
  });

  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            animation,
            width: MediaQuery.of(context).size.width * 0.8,
          ),
          const Gap(TSizes.defaultSpace),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const Gap(TSizes.defaultSpace),
          showAction
              ? SizedBox(
                  width: 250,
                  child: OutlinedButton(
                    onPressed: onActionPressed,
                    style:
                        OutlinedButton.styleFrom(backgroundColor: TColors.dark),
                    child: Text(
                      actionText!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .apply(color: TColors.light),
                    ),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
