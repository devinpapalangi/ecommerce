import 'package:ecommerce/utils/contants/colors.dart';
import 'package:ecommerce/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class RatingIndicator extends StatelessWidget {
  const RatingIndicator({
    super.key,
    required this.label,
    required this.value,
  });

  final String label;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        Expanded(
          flex: 11,
          child: SizedBox(
            width: TDeviceUtils.getScreenWidth(context) * 0.8,
            child: LinearProgressIndicator(
              value: value,
              minHeight: 11,
              backgroundColor: TColors.grey,
              valueColor: const AlwaysStoppedAnimation(TColors.primary),
              borderRadius: BorderRadius.circular(7),
            ),
          ),
        )
      ],
    );
  }
}
