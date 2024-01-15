import 'package:flutter/material.dart';

class ProductBrandText extends StatelessWidget {
  const ProductBrandText({super.key, required this.brand});

  final String brand;
  @override
  Widget build(BuildContext context) {
    return Text(
      brand,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: Theme.of(context).textTheme.labelMedium,
    );
  }
}
