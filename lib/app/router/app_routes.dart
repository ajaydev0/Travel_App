part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const splashScreen = _Path.splashScreen;
  static const HomePage = _Path.HomePage;
  static const login_Page = _Path.login_Page;
  static const signUp_Page = _Path.signUp_Page;
  static const nav_Bar = _Path.nav_Bar;
  static const onBoard = _Path.onBoard;
}

abstract class _Path {
  _Path._();
  static const splashScreen = "/";
  static const HomePage = "/HomePage";
  static const login_Page = '/login-page';
  static const signUp_Page = '/signup-page';
  static const nav_Bar = '/Nav_bar';
  static const onBoard = "/onBoard";
}
