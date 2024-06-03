import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/app/const/const.dart';
import 'package:travel_app/app/const/theme_Colors.dart';
import '../../../widgets/KText.dart';
import '../controllers/onboard_controller.dart';
import '../model/onBoardModel.dart';

class OnboardView extends GetView<OnboardController> {
  const OnboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(OnboardController());
    var kHeight = MediaQuery.of(context).size.height / 100;
    var kWidth = MediaQuery.of(context).size.width / 100;
    return Obx(
      () => Scaffold(
          body: Stack(children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    "${controller.selectedIndex.value + 1}",
                    style: TextStyle(
                        color: kc.primaryTextColor,
                        fontSize: kWidth * 7,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '/${onBoardList.length}',
                    style: TextStyle(
                        color: kc.secondaryTextColor, fontSize: kWidth * 4.5),
                  )
                ],
              ),
              controller.selectedIndex.value == 2
                  ? TextButton(
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all(Colors.white),
                      ),
                      onPressed: () {},
                      child: const SizedBox())
                  : TextButton(
                      style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.all(Colors.grey.shade300),
                      ),
                      onPressed: () {
                        controller.pageController.animateToPage(3,
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.linear);
                      },
                      child: Ktext(
                        text: "Skip",
                        fontSize: kWidth * 5,
                        fontWeight: FontWeight.bold,
                        color: Kcolor.black,
                      )),
            ],
          ),
        ),
        // Image.asset("assets/bac.png"),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: kHeight * 17),
            SizedBox(
              height: kHeight * 55,
              child: PageView.builder(
                onPageChanged: (value) {
                  controller.selectedIndex.value = value;
                },
                itemCount: onBoardList.length,
                controller: controller.pageController,
                itemBuilder: (context, index) {
                  var data = onBoardList[index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: kHeight * 40,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(data.imageUrl))),
                      ),
                      Ktext(
                        text: data.title,
                        fontSize: kWidth * 5.6,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: kHeight * 1.5),
                      Ktext(
                          text: data.description,
                          fontSize: kWidth * 3.6,
                          color: Colors.grey[500]),
                      SizedBox(height: kHeight * 3.7),
                    ],
                  );
                },
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: kHeight * 1.1,
                  width: kWidth * 4.3,
                  decoration: BoxDecoration(
                      color: controller.selectedIndex.value == 0
                          ? Kcolor.black
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(10)),
                ),
                SizedBox(width: kWidth * 3),
                Container(
                  height: kHeight * 1.1,
                  width: kWidth * 4.3,
                  decoration: BoxDecoration(
                      color: controller.selectedIndex.value == 1
                          ? Kcolor.black
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(10)),
                ),
                SizedBox(width: kWidth * 3),
                Container(
                  height: kHeight * 1.1,
                  width: kWidth * 4.3,
                  decoration: BoxDecoration(
                      color: controller.selectedIndex.value == 2
                          ? Kcolor.black
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(10)),
                ),
              ],
            ),
            SizedBox(height: kHeight * 7),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: kWidth * 2.6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  controller.selectedIndex.value == 0
                      ? TextButton(
                          style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Colors.white),
                          ),
                          onPressed: () {},
                          child: const SizedBox())
                      : TextButton(
                          style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Colors.grey.shade300),
                          ),
                          onPressed: () {
                            controller.pageController.previousPage(
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.linear);
                          },
                          child: Ktext(
                            text: "Back",
                            fontSize: kWidth * 5,
                            fontWeight: FontWeight.bold,
                            color: Kcolor.black,
                          )),
                  controller.selectedIndex.value == 2
                      ? TextButton(
                          style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Colors.grey.shade300),
                          ),
                          onPressed: () {
                            controller.startButton();
                          },
                          child: Ktext(
                            text: "Start",
                            fontSize: kWidth * 5,
                            fontWeight: FontWeight.bold,
                            color: Kcolor.black,
                          ))
                      : TextButton(
                          style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Colors.grey.shade300),
                          ),
                          onPressed: () {
                            controller.pageController.nextPage(
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.linear);
                          },
                          child: Ktext(
                            text: "Next",
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Kcolor.black,
                          )),
                ],
              ),
            ),
            const SizedBox(height: 0),
            // controller.selectedIndex.value == 2
            //     ? SizedBox(
            //         height: 50,
            //         width: 250,
            //         child: ElevatedButton(
            //             style: ElevatedButton.styleFrom(
            //                 elevation: 5,
            //                 backgroundColor: Kcolor.main,
            //               ),
            //             onPressed: () {
            //               // Get.toNamed(Routes.selectUserPage);
            //             },
            //             child:  Text("Get Started",
            //                 style: TextStyle(
            //                     fontWeight: FontWeight.bold, fontSize: 16,color: Kcolor.white))))
            //     : SizedBox(
            //         height: 50,
            //         width: 250,
            //         child: ElevatedButton(
            //             style: ElevatedButton.styleFrom(
            //                 elevation: 5,
            //                 backgroundColor: Kcolor.main,
            //                 foregroundColor: Kcolor.black),
            //             onPressed: () {
            //               controller.pageController.nextPage(
            //                   duration: const Duration(milliseconds: 400),
            //                   curve: Curves.linear);
            //             },
            //             child:  Text("Next",
            //                 style: TextStyle(
            //                     fontWeight: FontWeight.bold, fontSize: 16,color: Kcolor.white)))),
          ],
        ),
      ])),
    );
  }
}
