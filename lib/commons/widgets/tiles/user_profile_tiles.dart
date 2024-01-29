import 'package:ecommerce/commons/widgets/images/circular_images.dart';
import 'package:ecommerce/features/personalization/controllers/user_controller.dart';
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
    final controller = Get.put(UserController());
    return ListTile(
      title: Obx(
        () => Text(
          controller.user.value.fullName,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: TColors.white),
        ),
      ),
      subtitle: Obx(
        () => Text(
          controller.user.value.email,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(color: TColors.white),
        ),
      ),
      leading: Obx(() {
        final networkImage = controller.user.value.profilePicture;
        final image = networkImage.isEmpty ? TImages.user : networkImage;
        return CircularImage(
          image: image,
          isNetworkImage: networkImage.isNotEmpty,
          width: 50,
          height: 50,
          padding: 0,
        );
      }),
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
