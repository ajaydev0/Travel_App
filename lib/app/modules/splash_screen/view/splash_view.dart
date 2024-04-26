import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
          Image.asset(
            "assets/icon.png",
            height: 120,
          ),
          const SizedBox(height: 5),
          const SizedBox(
              height:25,
              width:25,
              child: FittedBox(
                  child: CupertinoActivityIndicator(
                color: Colors.black,
              ))),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 150),
          //   child: LinearProgressIndicator(color: Colors.blue[300],borderRadius: BorderRadius.circular(20),),
          // ),
        ],
      )),
    );
  }
}
