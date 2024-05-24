import 'package:get/get.dart';
import '../modules/LoginPage/bindings/login_page_binding.dart';
import '../modules/LoginPage/views/login_page_view.dart';
import '../modules/NavBar/bindings/nav_bar_binding.dart';
import '../modules/NavBar/views/nav_bar_view.dart';
import '../modules/Onboard/bindings/onboard_binding.dart';
import '../modules/Onboard/views/onboard_view.dart';
import '../modules/SignupPage/bindings/signup_page_binding.dart';
import '../modules/SignupPage/views/signup_page_view.dart';
import '../modules/homePage/bindings/home_page_binding.dart';
import '../modules/homePage/views/home_page_view.dart';
import '../modules/splash_screen/binding/splash_binding.dart';
import '../modules/splash_screen/view/splash_view.dart';

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
      name: Routes.HomePage,
      page: () => const HomePageView(),
      binding: HomePageBinding(),
    ),

    GetPage(
      name: Routes.login_Page,
      page: () => const LoginPageView(),
      binding: LoginPageBinding(),
    ),
    GetPage(
      name: Routes.signUp_Page,
      page: () => const SignupPageView(),
      binding: SignupPageBinding(),
    ),
     GetPage(
      name: Routes.nav_Bar,
      page: () => const NavBarView(),
      binding: NavBarBinding(),
    ),
     GetPage(
      name: _Path.onBoard,
      page: () => const OnboardView(),
      binding: OnboardBinding(),
    ),
   
  ];
}
