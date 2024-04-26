import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:travel_app/app/router/app_pages.dart';

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
          "assets/mountain.jpg",
        ),
        fit: BoxFit.cover),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
        const Text(
          "Welcome!",
          style: TextStyle(color: Colors.white, fontSize: 30,fontWeight: FontWeight.bold),
        ),
         const SizedBox(height: 10),
        Text(
          "The journey is ypur home.Explore the world with your travel app and get the feeling like your own home.",
          style: TextStyle(color: Colors.grey[200], fontSize: 15),
        ),
        const SizedBox(height: 20),
        GestureDetector(
          onTap: () {
            Get.toNamed(Routes.HomePage);
          },
          child: Container(
            height: 50,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Padding(
              padding: const EdgeInsets.all(13),
              child: Image.asset("assets/google.png"),
            ),const Text("Continue with Google",style: TextStyle(fontWeight: FontWeight.bold),)],),
          ),
        ),
        const SizedBox(height: 10),
        GestureDetector(
           onTap: () {
            Get.toNamed(Routes.HomePage);
          },
          child: Container(
            height: 50,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Padding(
              padding: const EdgeInsets.all(13),
              child: Image.asset("assets/facebook.png"),
            ),const Text("Continue with Facebook",style: TextStyle(fontWeight: FontWeight.bold),)],),
          ),
        ),
               const SizedBox(height: 30),
                  ],
                ),
              ),
            ));
  }
}
