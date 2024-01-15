import 'package:ecommerce/commons/widgets/images/circular_images.dart';
import 'package:ecommerce/features/personalization/screens/profile.dart';
import 'package:ecommerce/utils/contants/colors.dart';
import 'package:ecommerce/utils/contants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Coding with T',
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: TColors.white),
      ),
      subtitle: Text(
        'codingwithT@gmail.com',
        style:
            Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),
      ),
      leading: const CircularImage(
        image: TImages.user,
        width: 50,
        height: 50,
        padding: 0,
      ),
      trailing: IconButton(
        icon: const Icon(
          Iconsax.edit,
          color: TColors.white,
        ),
        onPressed: () => Get.to(() => const ProfileScreen()),
      ),
    );
  }
}
