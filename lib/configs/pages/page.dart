import 'package:get/get.dart';
import 'package:lappyhub/configs/routes/route.dart';
import 'package:lappyhub/features/chat/bindings/chat_binding.dart';
import 'package:lappyhub/features/chat/view/ui/chat_screen.dart';
import 'package:lappyhub/features/checkout/bindings/checkout_binding.dart';
import 'package:lappyhub/features/checkout/sub_features/payment/bindings/payment_binding.dart';
import 'package:lappyhub/features/checkout/sub_features/payment/view/ui/payment_screen.dart';
import 'package:lappyhub/features/checkout/sub_features/success_checkout/binding/success_binding.dart';
import 'package:lappyhub/features/checkout/sub_features/success_checkout/view/ui/success_checkout_screen.dart';
import 'package:lappyhub/features/checkout/view/ui/checkout_screen.dart';
import 'package:lappyhub/features/home/bindings/detail_laptop_binding.dart';
import 'package:lappyhub/features/home/bindings/home_binding.dart';
import 'package:lappyhub/features/home/sub_features/category_laptop_detail/bindings/category_laptop_detail_binding.dart';
import 'package:lappyhub/features/home/sub_features/category_laptop_detail/view/ui/category_laptop_detail_screen.dart';
import 'package:lappyhub/features/home/sub_features/search_laptop/bindings/search_laptop_binding.dart';
import 'package:lappyhub/features/home/sub_features/search_laptop/view/ui/search_laptop_screen.dart';
import 'package:lappyhub/features/home/view/ui/detail_laptop_screen.dart';
import 'package:lappyhub/features/home/view/ui/home_screen.dart';
import 'package:lappyhub/features/login/bindings/login_binding.dart';
import 'package:lappyhub/features/login/view/ui/login_screen.dart';
import 'package:lappyhub/features/main/bindings/main_binding.dart';
import 'package:lappyhub/features/main/view/ui/main_screen.dart';
import 'package:lappyhub/features/order/bindings/order_binding.dart';
import 'package:lappyhub/features/order/sub_features/detail_order/bindings/detail_order_binding.dart';
import 'package:lappyhub/features/order/sub_features/detail_order/view/ui/detail_order_screen.dart';
import 'package:lappyhub/features/order/view/ui/order_screen.dart';
import 'package:lappyhub/features/profile/bindings/profile_binding.dart';
import 'package:lappyhub/features/profile/sub_features/edit_profile/bindings/edit_profile_binding.dart';
import 'package:lappyhub/features/profile/sub_features/edit_profile/view/ui/edit_profile_screen.dart';
import 'package:lappyhub/features/profile/sub_features/social_media/bindings/social_media_binding.dart';
import 'package:lappyhub/features/profile/sub_features/social_media/view/ui/social_media_screen.dart';
import 'package:lappyhub/features/profile/view/ui/profile_screen.dart';
import 'package:lappyhub/features/register/bindings/register_binding.dart';
import 'package:lappyhub/features/register/view/ui/register_screen.dart';
import 'package:lappyhub/features/search_location/bindings/search_location_binding.dart';
import 'package:lappyhub/features/search_location/view/ui/search_location_screen.dart';
import 'package:lappyhub/features/splash/bindings/splash_binding.dart';
import 'package:lappyhub/features/splash/view/ui/splash_screen.dart';

abstract class Pages {
  static final pages = [
    GetPage(
      name: Routes.splashRoute,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.searchLocationRoute,
      page: () => SearchLocationScreen(),
      binding: SearchLocationBinding(),
    ),
    GetPage(
      name: Routes.loginRoute,
      page: () => LoginScreen(),
      binding: LoginBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.registerRoute,
      page: () => RegisterScreen(),
      binding: RegisterBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.mainRoute,
      page: () => MainScreen(),
      binding: MainBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.homeRoute,
      page: () => HomeScreen(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.detailLaptopRoute,
      page: () => DetailLaptopScreen(),
      binding: DetailLaptopBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.orderRoute,
      page: () => OrderScreen(),
      binding: OrderBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.chatRoute,
      page: () => ChatScreen(),
      binding: ChatBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.profileRoute,
      page: () => ProfileScreen(),
      binding: ProfileBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.checkoutRoute,
      page: () => CheckoutScreen(),
      binding: CheckoutBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.checkoutPaymentRoute,
      page: () => PaymentScreen(),
      binding: PaymentBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.checkoutSuccessCheckoutRoute,
      page: () => SuccessCheckoutScreen(),
      binding: SuccessBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.homeSearchLaptopRoute,
      page: () => SearchLaptopScreen(),
      binding: SearchLaptopBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.homeCategoryLaptopDetailRoute,
      page: () => CategoryLaptopDetailScreen(),
      binding: CategoryLaptopDetailBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.detailOrderRoute,
      page: () => DetailOrderScreen(),
      binding: DetailOrderBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.editProfileRoute,
      page: () => EditProfileScreen(),
      binding: EditProfileBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.socialMediaRoute,
      page: () => SocialMediaScreen(),
      binding: SocialMediaBinding(),
      transition: Transition.fadeIn,
    ),
  ];
}
