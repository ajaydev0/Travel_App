import 'package:get/get.dart';

import '../modules/homePage/bindings/home_page_binding.dart';
import '../modules/homePage/views/home_page_view.dart';
import '../modules/splash_screen/binding/splash_binding.dart';
import '../modules/splash_screen/view/splash_view.dart';
import '../modules/welcomePage/bindings/welcome_page_binding.dart';
import '../modules/welcomePage/views/welcome_page_view.dart';

part 'app_routes.dart';

class AppPages {
  static const initialPage = Routes.splashScreen;
  static final pages = [
    GetPage(
      name: _Path.splashScreen,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Path.WelcomePage,
      page: () => const WelcomePageView(),
      binding: WelcomePageBinding(),
    ),
    GetPage(
      name: Routes.HomePage,
      page: () => const HomePageView(),
      binding: HomePageBinding(),
    ),
   
  ];
}
