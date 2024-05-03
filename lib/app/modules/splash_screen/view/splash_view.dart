import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../const/const.dart';
import '../../../widgets/KText.dart';
import '../controller/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: Kcolor.mainColor,
                borderRadius: BorderRadius.circular(15)),
            child: const Icon(
              Icons.map,
              color: Colors.white,
              size: 35,
            ),
          ),

          Ktext(
            text: "Travel Guide",
            color: Kcolor.black,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),

          Ktext(
            text: "Find your Best Place",
            color: Colors.black.withOpacity(.4),
            fontSize: 13,
          ),
          // const SizedBox(height: 10),
          // const SizedBox(
          //     height: 25,
          //     width: 25,
          //     child: FittedBox(
          //         child: CupertinoActivityIndicator(
          //       color: Colors.black,
          //     ))),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 150),
          //   child: LinearProgressIndicator(color: Colors.blue[300],borderRadius: BorderRadius.circular(20),),
          // ),
        ],
      )),
    );
  }
}
