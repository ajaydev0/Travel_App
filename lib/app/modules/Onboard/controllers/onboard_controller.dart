import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../const/get_Storage..dart';
import '../../../router/app_pages.dart';

class OnboardController extends GetxController {
  RxInt selectedIndex = 0.obs;

  late PageController pageController;
  @override
  void onInit() {
    pageController = PageController(initialPage: selectedIndex.value);
    super.onInit();
  }
  
  startButton(){
    Get.toNamed(Routes.login_Page);
    box.value.write("OnBoard", "Dekha Ses");
  }
}
