// ignore_for_file: camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../main.dart';
import '../../../const/const.dart';
import '../../../router/app_pages.dart';
import '../../../widgets/KText.dart';
import '../controllers/login_page_controller.dart';

class LoginPageView extends GetView<LoginPageController> {
  const LoginPageView({super.key});
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(LoginPageController());
    return Obx(
      () => GestureDetector(
        onTap: () {
          controller.isLoading.value = false;
        },
        child: Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.white,
              ),
              body: SingleChildScrollView(
                child: Container(
                  color: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Ktext(
                              text: "Log in to your existant Account",
                              fontSize: 13,
                              color: Colors.grey.shade600,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Ktext(
                          text: "E-mail",
                          fontWeight: FontWeight.bold,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          validator: (value) {
                            return controller.validateEmail(value);
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: controller.email,
                          onTapOutside: ((ajay) {
                            FocusScope.of(context).unfocus();
                          }),
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.email_outlined,
                              color: Colors.grey,
                            ),
                            hintText: "Enter your email...",
                            hintStyle: const TextStyle(
                                color: Colors.grey,
                                fontFamily: "Aleo",
                                fontSize: 14),
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
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Ktext(
                          text: "Password",
                          fontWeight: FontWeight.bold,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          validator: (value) {
                            return controller.validatePass(value);
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: controller.pass,
                          onTapOutside: ((ajay) {
                            FocusScope.of(context).unfocus();
                          }),
                          onChanged: (password) =>
                              controller.onPasswordChanged(password),
                          obscureText: !controller.isVisible.value,
                          decoration: InputDecoration(
                            hintText: "Enter your password...",
                            hintStyle: const TextStyle(
                                color: Colors.grey,
                                fontFamily: "Aleo",
                                fontSize: 14),
                            prefixIcon: const Icon(
                              Icons.lock_open_outlined,
                              color: Colors.grey,
                            ),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: IconButton(
                                onPressed: () {
                                  controller.isVisible.value =
                                      !controller.isVisible.value;
                                },
                                icon: controller.isVisible.value
                                    ? const Icon(
                                        Icons.visibility,
                                        color: Colors.black,
                                      )
                                    : const Icon(
                                        Icons.visibility_off,
                                        color: Colors.grey,
                                      ),
                              ),
                            ),
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
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              width: 13,
                              height: 13,
                              decoration: BoxDecoration(
                                  color:
                                      controller.isPasswordEightCharacters.value
                                          ? Colors.green
                                          : Colors.transparent,
                                  border: controller
                                          .isPasswordEightCharacters.value
                                      ? Border.all(color: Colors.transparent)
                                      : Border.all(color: Colors.grey.shade400),
                                  borderRadius: BorderRadius.circular(50)),
                              child: const Center(
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 10,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Ktext(
                              text: "Contains at least 8 characters",
                              fontSize: 11,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              width: 13,
                              height: 13,
                              decoration: BoxDecoration(
                                  color: controller.hasPasswordOneNumber.value
                                      ? Colors.green
                                      : Colors.transparent,
                                  border: controller.hasPasswordOneNumber.value
                                      ? Border.all(color: Colors.transparent)
                                      : Border.all(color: Colors.grey.shade400),
                                  borderRadius: BorderRadius.circular(50)),
                              child: const Center(
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 10,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Ktext(
                              text: "Contains at least 1 number",
                              fontSize: 11,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        MaterialButton(
                          height: 50,
                          minWidth: double.infinity,
                          onPressed: () {
                            controller.onClickLogIn();
                          },
                          color: Kcolor.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          child: Ktext(
                            text: "LOGIN",
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 1.3,
                              width: size.width * .32,
                              color: Colors.grey.withOpacity(.5),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Ktext(
                                text: "Or",
                                color: Colors.grey.shade600,
                                fontSize: 13,
                              ),
                            ),
                            Container(
                              height: 1.3,
                              width: size.width * .32,
                              color: Colors.grey.withOpacity(.5),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            loginBoxes(
                              imgUrl: "assets/icons/google.png",
                              onTap: () {
                                print("Google");
                                // controller.isLoading.value = true;
                                controller.signInWithGoogle();
                              },
                            ),
                           
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Get.toNamed(Routes.signUp_Page);
                                },
                                child: Row(
                                  children: [
                                    Ktext(
                                      text: "Don't have an account? ",
                                      fontSize: 13,
                                      color: Colors.black.withOpacity(.5),
                                    ),
                                    Ktext(
                                      text: "Sign Up",
                                      fontSize: 13,
                                      color: Kcolor.mainColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ],
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            controller.isLoading.value ? const Loading() : const SizedBox(),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
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
    return MaterialButton(
      elevation: 5,
      height: 50,
      minWidth: 60,
      onPressed: onTap,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      child: Row(
       mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imgUrl,
            height: 22,
          ),
        SizedBox(width: 10),
        Text("Continue with Google",style: TextStyle(fontSize: 14,color:Colors.black.withOpacity(.5)),),
          // Ktext(text: "Continue with Google",fontSize: 13),
        ],
      ),
    );
  }
}

//Loading Widgets

class Loading extends StatelessWidget {
  const Loading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.black.withOpacity(.6),
      alignment: Alignment.center,
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: 65,
          width: 70,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          alignment: Alignment.center,
          child: const SizedBox(
              height: 30,
              width: 30,
              child: FittedBox(
                  child: CupertinoActivityIndicator(
                color: Colors.black,
              ))),
        ),
      ),
    );
  }
}
