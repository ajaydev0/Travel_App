part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const splashScreen = _Path.splashScreen;
  static const WelcomePage = _Path.WelcomePage;
  static const HomePage = _Path.HomePage;
}

abstract class _Path {
  _Path._();
  static const splashScreen = "/";
  static const WelcomePage = "/WelcomePage";
  static const HomePage = "/HomePage";
}
