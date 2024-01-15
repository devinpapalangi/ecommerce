import 'package:ecommerce/commons/widgets/texts/section_heading.dart';
import 'package:ecommerce/utils/contants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeading(title: 'Shipping Address', buttonTitle: 'Change'),
        Text('Coding With T'),
        Gap(TSizes.spaceBtwItems),
        Row(
          children: [
            Icon(
              Icons.phone,
              color: Colors.grey,
              size: 16,
            ),
            Gap(TSizes.spaceBtwItems),
            Text('0812387321')
          ],
        ),
        Gap(TSizes.spaceBtwItems),
        Row(
          children: [
            Icon(
              Icons.location_history,
              color: Colors.grey,
              size: 16,
            ),
            Gap(TSizes.spaceBtwItems),
            Text('Jl.Kedondong, No .7, Jagakarsa')
          ],
        )
      ],
    );
  }
}
