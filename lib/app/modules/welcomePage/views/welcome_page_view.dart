import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:travel_app/app/const/const.dart';
import 'package:travel_app/app/router/app_pages.dart';

import '../../../widgets/KText.dart';
import '../controllers/welcome_page_controller.dart';

class WelcomePageView extends GetView<WelcomePageController> {
  const WelcomePageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              "assets/travel.jpg",
            ),
            fit: BoxFit.cover),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100, bottom: 8),
                  child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          color: Kcolor.mainColor,
                          borderRadius: BorderRadius.circular(15)),
                      child: const Icon(
                        Icons.map,
                        color: Colors.white,
                        size: 35,
                      )),
                ),
                Ktext(
                  text: "Travel Guide",
                  color: Kcolor.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                Ktext(
                  text: "Find your Best Place for...",
                  color: Colors.grey[200],
                  fontSize: 13,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: MaterialButton(
                  height: 50,
                  minWidth: double.infinity,
                  onPressed: () {
                    // controller.onClickCreateAccount();
                    Get.toNamed(Routes.login_Page);
                  },
                  color: Kcolor.mainColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  child: Ktext(
                    text: "Get Started",
                    color: Kcolor.white,
                    fontSize: 17,
                  )),
            ),
          ],
        ),
      ),
    ));
  }
}
