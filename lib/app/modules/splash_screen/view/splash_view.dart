import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../const/const.dart';
import '../../../const/theme_Colors.dart';
import '../../../widgets/KText.dart';
import '../controller/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    var kHeight = MediaQuery.of(context).size.height / 100;
    var kWidth = MediaQuery.of(context).size.width / 100;
    return Scaffold(
        backgroundColor:  Colors.white,
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
              height: kHeight * 8,
              width: kWidth * 17,
              decoration: BoxDecoration(
                  color: Kcolor.mainColor,
                  borderRadius: BorderRadius.circular(15)),
              child: Icon(Icons.map, color: Colors.white, size: kWidth * 10)),
          Ktext(
              text: "Travel Guide",
              color: Kcolor.black,
              fontSize: kWidth * 8.4,
              fontWeight: FontWeight.bold),
          Ktext(
              text: "Find your Best Place",
              color: Colors.black.withOpacity(.4),
              fontSize: kWidth * 3.6)
        ])));
  }
}
