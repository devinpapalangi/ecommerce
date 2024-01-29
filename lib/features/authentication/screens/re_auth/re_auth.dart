import 'package:ecommerce/commons/widgets/appbar/appbar.dart';
import 'package:ecommerce/features/authentication/screens/widgets/re_auth/re_auth_form.dart';
import 'package:ecommerce/utils/contants/sizes.dart';
import 'package:flutter/material.dart';

class ReAuthScreen extends StatelessWidget {
  const ReAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text(
          'Re-Authenticate User',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(
            TSizes.defaultSpace,
          ),
          child: ReAuthForm(),
        ),
      ),
    );
  }
}
