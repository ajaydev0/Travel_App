// ignore_for_file: camel_case_types, must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../const/const.dart';
import '../../../router/app_pages.dart';
import '../../../widgets/KText.dart';
import '../controllers/login_page_controller.dart';

class LoginPageView extends GetView<LoginPageController> {
  const LoginPageView({super.key});
  @override
  Widget build(BuildContext context) {
    var kHeight = MediaQuery.of(context).size.height / 100;
    var kWidth = MediaQuery.of(context).size.width / 100;
    var controller = Get.put(LoginPageController());
    return Obx(() => GestureDetector(
        onTap: () {
          controller.isLoading.value = false;
        },
        //Stack Use for Loading Indicator
        child: Stack(children: [
          Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.white,
              ),
              body: SingleChildScrollView(
                  child: Container(
                      color: Colors.white,
                      padding: EdgeInsets.symmetric(
                          horizontal: kWidth * 5.5, vertical: kHeight * 3.2),
                      child: Form(
                          key: controller.formKey,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Ktext(
                                          text: "Login",
                                          fontSize: kWidth * 14,
                                          fontWeight: FontWeight.bold)
                                    ]),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Ktext(
                                          text:
                                              "Log in to your existant Account",
                                          fontSize: kWidth * 3.7,
                                          color: Colors.grey.shade600)
                                    ]),
                                SizedBox(height: kHeight * 4),
                                Ktext(
                                    text: "E-mail",
                                    fontWeight: FontWeight.bold),
                                SizedBox(height: kHeight * 0.7),
                                TextFormField(
                                  validator: (value) {
                                    return controller.validateEmail(value);
                                  },
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  controller: controller.email,
                                  onTapOutside: ((ajay) {
                                    FocusScope.of(context).unfocus();
                                  }),
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(
                                      Icons.email_outlined,
                                      color: Colors.grey
                                    ),
                                    hintText: "Enter your email...",
                                    hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: "Aleo",
                                        fontSize: kWidth * 3.9),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.grey.withOpacity(.5),
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide()),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Kcolor.black, width: 1.5)),
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: kWidth * 5.5,
                                        vertical: kHeight * 2.7)
                                  )
                                ),
                                SizedBox(height: kHeight * 1.3),
                                Ktext(
                                    text: "Password",
                                    fontWeight: FontWeight.bold),
                                SizedBox(height: kHeight * 0.7),
                                TextFormField(
                                  validator: (value) {
                                    return controller.validatePass(value);
                                  },
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  controller: controller.pass,
                                  onTapOutside: ((ajay) {
                                    FocusScope.of(context).unfocus();
                                  }),
                                  onChanged: (password) =>
                                      controller.onPasswordChanged(password),
                                  obscureText: !controller.isVisible.value,
                                  decoration: InputDecoration(
                                    hintText: "Enter your password...",
                                    hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: "Aleo",
                                        fontSize: kWidth * 3.9),
                                    prefixIcon: const Icon(
                                      Icons.lock_open_outlined,
                                      color: Colors.grey
                                    ),
                                    suffixIcon: Padding(
                                      padding:
                                          EdgeInsets.only(right: kWidth * 1.5),
                                      child: IconButton(
                                        onPressed: () {
                                          controller.isVisible.value =
                                              !controller.isVisible.value;
                                        },
                                        icon: controller.isVisible.value
                                            ? const Icon(
                                                Icons.visibility,
                                                color: Colors.black
                                              )
                                            : const Icon(
                                                Icons.visibility_off,
                                                color: Colors.grey
                                              )
                                      )
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.grey.withOpacity(.5)
                                      )
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide()),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Kcolor.black, width: 1.5)),
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: kWidth * 5.5,
                                        vertical: kHeight * 2.7)
                                  )
                                ),
                          
                                SizedBox(height: kHeight * 1.3),
                                Row(
                                  children: [
                                    AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      height: kHeight * 1.7,
                                      width: kWidth * 3.6,
                                      decoration: BoxDecoration(
                                          color: controller
                                                  .isPasswordEightCharacters
                                                  .value
                                              ? Colors.green
                                              : Colors.transparent,
                                          border: controller
                                                  .isPasswordEightCharacters
                                                  .value
                                              ? Border.all(
                                                  color: Colors.transparent)
                                              : Border.all(
                                                  color: Colors.grey.shade400),
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: Center(
                                        child: Icon(
                                          Icons.check,
                                          color: Colors.white,
                                          size: kWidth * 2.9
                                        )
                                      )
                                    ),
                      
                                    SizedBox(width: kWidth * 1.5),
                                    Ktext(
                                      text: "Contains at least 8 characters",
                                      fontSize: kWidth * 3.05
                                    )
                                  ]
                                ),
                                SizedBox(height: kHeight * 0.7),
                                Row(
                                  children: [
                                    AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 500),
                                      height: kHeight * 1.7,
                                      width: kWidth * 3.6,
                                      decoration: BoxDecoration(
                                          color: controller
                                                  .hasPasswordOneNumber.value
                                              ? Colors.green
                                              : Colors.transparent,
                                          border: controller
                                                  .hasPasswordOneNumber.value
                                              ? Border.all(
                                                  color: Colors.transparent)
                                              : Border.all(
                                                  color: Colors.grey.shade400),
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: Center(
                                        child: Icon(
                                          Icons.check,
                                          color: Colors.white,
                                          size: kWidth * 2.9
                                        )
                                      )
                                    ),
                                    SizedBox(width: kWidth * 1.5),
                                    Ktext(
                                      text: "Contains at least 1 number",
                                      fontSize: kWidth * 3.05
                                    )
                                  ]
                                ),
                                SizedBox(
                                  height: kHeight * 4
                                ),
                                MaterialButton(
                                  height: kHeight * 6.8,
                                  minWidth: double.infinity,
                                  onPressed: () {
                                    controller.onClickLogIn();
                                  },
                                  color: Kcolor.black,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Ktext(
                                    text: "LOGIN",
                                    color: Colors.white
                                  )
                                ),
                  
                                SizedBox(height: kHeight * 2.7),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: kHeight * 0.2,
                                      width: kWidth * 32,
                                      color: Colors.grey.withOpacity(.5)
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: Ktext(
                                        text: "Or",
                                        color: Colors.grey.shade600,
                                        fontSize: kWidth * 3.7
                                      )
                                    ),
                                    Container(
                                      height: kHeight * 0.2,
                                      width: kWidth * 32,
                                      color: Colors.grey.withOpacity(.5)
                                    )
                                  ]
                                ),
                           
                                SizedBox(height: kHeight * 2.7),
                                loginBoxes(
                                  imgUrl: "assets/icons/google.png",
                                  onTap: () {
                                    print("Google");
                                    // controller.isLoading.value = true;
                                    controller.signInWithGoogle();
                                  }
                                ),
              
                                SizedBox(height: kHeight * 1.3),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            Get.toNamed(Routes.signUp_Page);
                                          },
                                          child: Row(children: [
                                            Ktext(
                                              text: "Don't have an account? ",
                                              fontSize: kWidth * 3.7,
                                              color:
                                                  Colors.black.withOpacity(.5),
                                            ),
                                            Ktext(
                                                text: "Sign Up",
                                                fontSize: kWidth * 3.7,
                                                color: Kcolor.mainColor,
                                                fontWeight: FontWeight.bold)
                                          ]))
                                    ])
                              ]))))),
          controller.isLoading.value ? const Loading() : const SizedBox()
        ])));
  }
}

class loginBoxes extends StatelessWidget {
  String imgUrl;
  void Function()? onTap;
  loginBoxes({
    super.key,
    required this.imgUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var kHeight = MediaQuery.of(context).size.height / 100;
    var kWidth = MediaQuery.of(context).size.width / 100;
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: kWidth * 1.5),
        child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(10),
            ),
            child: MaterialButton(
                elevation: 5,
                height: kHeight * 6.8,
                // minWidth: 60,
                onPressed: onTap,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Image.asset(
                    imgUrl,
                    height: kHeight * 2.8,
                  ),
                  SizedBox(width: kWidth * 2.6),
                  Text("Continue with Google",
                      style: TextStyle(
                          fontSize: kWidth * 3.9,
                          color: Colors.black.withOpacity(.5)))
                ]))));
  }
}

//Loading Widgets
class Loading extends StatelessWidget {
  const Loading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var kHeight = MediaQuery.of(context).size.height / 100;
    var kWidth = MediaQuery.of(context).size.width / 100;
    return Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black.withOpacity(.6),
        alignment: Alignment.center,
        child: Material(
            elevation: 3,
            borderRadius: BorderRadius.circular(20),
            child: Container(
                height: kHeight * 8.6,
                width: kWidth * 19.5,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
                child: SizedBox(
                    width: kWidth * 8,
                    child: FittedBox(
                        child: CupertinoActivityIndicator(
                            color: Colors.black))))));
  }
}
