import 'package:get/get.dart';
import '../../../const/get_Storage..dart';
import '../../../router/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    nextPage();
    super.onInit();
  }

  final onBoardCheck = box.value.read("OnBoard") == null;
  final userCheck = box.value.read("User") == null;
  nextPage() async {
    await Future.delayed(
      const Duration(milliseconds: 2000),
      () {
        if (onBoardCheck) {
          Get.offAllNamed(Routes.onBoard);
        } else if (userCheck) {
          Get.offAllNamed(Routes.login_Page);
        } else {
          Get.offAllNamed(Routes.nav_Bar);
        }
      },
    );
  }
}
