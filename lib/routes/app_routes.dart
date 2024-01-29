import 'package:ecommerce/features/authentication/screens/login/forget_password.dart';
import 'package:ecommerce/features/authentication/screens/login/login.dart';
import 'package:ecommerce/features/authentication/screens/onboarding/onboarding.dart';
import 'package:ecommerce/features/authentication/screens/register/register.dart';
import 'package:ecommerce/features/authentication/screens/register/verify_email.dart';
import 'package:ecommerce/features/personalization/screens/adresses.dart';
import 'package:ecommerce/features/personalization/screens/profile.dart';
import 'package:ecommerce/features/personalization/screens/settings.dart';
import 'package:ecommerce/features/shop/screens/cart.dart';
import 'package:ecommerce/features/shop/screens/checkout.dart';
import 'package:ecommerce/features/shop/screens/home.dart';
import 'package:ecommerce/features/shop/screens/order.dart';
import 'package:ecommerce/features/shop/screens/product_review.dart';
import 'package:ecommerce/features/shop/screens/store.dart';
import 'package:ecommerce/features/shop/screens/wishlist.dart';
import 'package:ecommerce/routes/routes.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: TRoutes.home, page: () => const HomeScreen()),
    GetPage(name: TRoutes.store, page: () => const StoreScreen()),
    GetPage(name: TRoutes.favourites, page: () => const Wishlist()),
    GetPage(name: TRoutes.settings, page: () => const SettingsScreen()),
    GetPage(
        name: TRoutes.productReviews, page: () => const ProductReviewScreen()),
    GetPage(name: TRoutes.order, page: () => const OrderScreen()),
    GetPage(name: TRoutes.checkout, page: () => const CheckoutScreen()),
    GetPage(name: TRoutes.cart, page: () => const CartScreen()),
    GetPage(name: TRoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: TRoutes.userAddress, page: () => const AddressScreen()),
    GetPage(name: TRoutes.signup, page: () => const RegisterScreen()),
    GetPage(name: TRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: TRoutes.signIn, page: () => const LoginScreen()),
    GetPage(
        name: TRoutes.forgetPassword, page: () => const ForgetPasswordScreen()),
    GetPage(name: TRoutes.onBoarding, page: () => const OnBoardingScreen()),
// Add more GetPage entries as needed
  ];
}
