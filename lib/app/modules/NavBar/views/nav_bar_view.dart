import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../main.dart';
import '../../../const/const.dart';
import '../controllers/nav_bar_controller.dart';

class NavBarView extends GetView<NavBarController> {
  const NavBarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var navBarHeight = size.height * .030;
    return Obx(
      () => Scaffold(
        extendBody: true,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(15),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: BottomNavigationBar(
                backgroundColor: Kcolor.mainColor,
                showUnselectedLabels: false,
                showSelectedLabels: false,
                type: BottomNavigationBarType.fixed,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      "assets/icons/home.png",

                      height: navBarHeight,
                      // height: 27,
                      color: Kcolor.white,
                    ),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      "assets/icons/movie.png",
                              height: navBarHeight,

                      // height: 27,
                      color: Kcolor.white,
                    ),
                    label: 'movie',
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      "assets/icons/message.png",
                             height: navBarHeight,
                      // height: 27,
                      color: Kcolor.white,
                    ),
                    label: 'message',
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      "assets/icons/person2.png",
                          height: navBarHeight,
                      // height: 27,
                      color: Kcolor.white,
                    ),
                    label: 'person',
                  ),
                ],
                onTap: (index) {
                  controller.currentindex.value = index;
                },
                currentIndex: controller.currentindex.value,
              ),
            ),
          ),
        ),
        body: controller.pages[controller.currentindex.value],
      ),
    );
  }
}
