import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        backgroundColor: kc.scaffoldColor,
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
              height: kHeight * 8,
              width: kWidth * 17,
              decoration: BoxDecoration(
                  color: kc.primaryColor,
                  borderRadius: BorderRadius.circular(15)),
              child: Icon(Icons.map, color: kc.splashScreenIconColor, size: kWidth * 10)),
          Ktext(
              text: "Travel Guide",
              color: kc.primaryTextColor,
              fontSize: kWidth * 8.4,
              fontWeight: FontWeight.bold),
          Ktext(
              text: "Find your Best Place",
              color: kc.secondaryTextColor ,
              fontSize: kWidth * 3.6)
        ])));
  }
}
