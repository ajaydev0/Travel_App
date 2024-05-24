import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../const/const.dart';
import '../controllers/nav_bar_controller.dart';

class NavBarView extends GetView<NavBarController> {
  const NavBarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height / 100;
    var screenWidth = MediaQuery.of(context).size.width / 100;
    var navBarHeight = screenHeight * 3.3;
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
                backgroundColor: Colors.grey.shade200,
                showUnselectedLabels: false,
                showSelectedLabels: false,
                type: BottomNavigationBarType.fixed,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      controller.currentindex.value == 0
                          ? "assets/icons/home.png"
                          : "assets/icons/home2.png",
                      height: navBarHeight,
                      // height: 27,
                      color: controller.currentindex.value == 0
                          ? Kcolor.black
                          : Colors.grey.shade500,
                    ),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      "assets/icons/movie.png",
                      height: navBarHeight,

                      // height: 27,
                      color: controller.currentindex.value == 1
                          ? Kcolor.black
                          : Colors.grey.shade500,
                    ),
                    label: 'movie',
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      "assets/icons/message.png",
                      height: navBarHeight,
                      // height: 27,
                      color: controller.currentindex.value == 2
                          ? Kcolor.black
                          : Colors.grey.shade500,
                    ),
                    label: 'message',
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      controller.currentindex.value == 3
                          ? "assets/icons/user.png"
                          : "assets/icons/user2.png",
                      height: navBarHeight,
                      // height: 27,
                      color: controller.currentindex.value == 3
                          ? Kcolor.black
                          : Colors.grey.shade500,
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
