import 'package:get/get.dart';
import 'package:lappyhub/configs/routes/route.dart';
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
  ];
}
