import 'package:ecommerce/commons/widgets/image_text_widget/vertical_image_text.dart';
import 'package:ecommerce/features/shop/screens/sub_categories.dart';
import 'package:ecommerce/utils/contants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return VerticalImageText(
            image: TImages.sportIcon,
            title: 'Sport',
            onTap: () => Get.to(
              () => const SubCategoriesScreen(),
            ),
          );
        },
      ),
    );
  }
}
