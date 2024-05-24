import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../const/const.dart';
import '../../../widgets/KText.dart';
import '../controllers/signup_page_controller.dart';

class SignupPageView extends GetView<SignupPageController> {
  const SignupPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(SignupPageController());
    var kHeight = MediaQuery.of(context).size.height / 100;
    var kWidth = MediaQuery.of(context).size.width / 100;
    return Obx(
      () => Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              // title: Text(
              //   "Create Your Account",
              //   style: TextStyle(color: Colors.black),
              // ),
            ),
            body: SingleChildScrollView(
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(
                    horizontal: kWidth * 5.5,
                    vertical: kHeight * 3.2),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Ktext(
                            text: "Create Your Account",
                            fontSize: kWidth * 8.4,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Ktext(
                            text: "please create your account, to join us.",
                            fontSize: kWidth * 3.7,
                            color: Colors.grey.shade600,
                          ),
                        ],
                      ),
                      SizedBox(height: kHeight * 5),
                      Ktext(text: "Name", fontWeight: FontWeight.bold),
                      SizedBox(height: kHeight * 0.7),
                      TextFormField(
                        validator: (value) {
                          return controller.validateName(value);
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: controller.name,
                        onTapOutside: ((ajay) {
                          FocusScope.of(context).unfocus();
                        }),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.person_outlined,
                            color: Colors.grey,
                          ),
                          hintText: "Enter your name...",
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
                              borderSide:
                                  BorderSide(color: Kcolor.black, width: 1.5)),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: kWidth * 5.5,
                              vertical: kHeight * 2.7),
                        ),
                      ),
                      SizedBox(height: kHeight * 1.3),
                      Ktext(text: "E-mail", fontWeight: FontWeight.bold),
                      SizedBox(height: kHeight * 0.7),
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
                              borderSide:
                                  BorderSide(color: Kcolor.black, width: 1.5)),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: kWidth * 5.5,
                              vertical: kHeight * 2.7),
                        ),
                      ),
                      SizedBox(height: kHeight * 1.3),
                      Ktext(
                        text: "Password",
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: kHeight * 0.7),
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
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontFamily: "Aleo",
                              fontSize: kWidth * 3.9),
                          prefixIcon: const Icon(
                            Icons.lock_open_outlined,
                            color: Colors.grey,
                          ),
                          suffixIcon: Padding(
                            padding: EdgeInsets.only(right: kWidth * 1.5),
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
                              borderSide:
                                  BorderSide(color: Kcolor.black, width: 1.5)),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: kWidth * 5.5,
                              vertical: kHeight * 2.7),
                        ),
                      ),
                      SizedBox(height: kHeight * 1.3),
                      Row(
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            height: kHeight * 2.0,
                            width: kWidth * 4.3,
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
                            child: Center(
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                                size: kWidth * 3.4,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: kWidth * 1.8,
                          ),
                          Ktext(
                            text: "Contains at least 8 characters",
                            fontSize: kWidth * 3.5,
                          )
                        ],
                      ),
                      SizedBox(
                        height: kHeight * 0.8,
                      ),
                      Row(
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            height: kHeight * 2.0,
                            width: kWidth * 4.3,
                            decoration: BoxDecoration(
                                color: controller.hasPasswordOneNumber.value
                                    ? Colors.green
                                    : Colors.transparent,
                                border: controller.hasPasswordOneNumber.value
                                    ? Border.all(color: Colors.transparent)
                                    : Border.all(color: Colors.grey.shade400),
                                borderRadius: BorderRadius.circular(50)),
                            child: Center(
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                                size: kWidth * 3.4,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: kWidth * 1.8,
                          ),
                          Ktext(
                            text: "Contains at least 1 number",
                            fontSize: kWidth * 3.5,
                          )
                        ],
                      ),
                      SizedBox(
                        height: kHeight * 7,
                      ),
                      MaterialButton(
                        height: kHeight * 6.8,
                        minWidth: double.infinity,
                        onPressed: () {
                          controller.onClickCreateAccount();
                        },
                        color: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        child: Ktext(
                          text: "CREATE ACCOUNT",
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          controller.isLoading.value ? const Loading() : const SizedBox(),
        ],
      ),
    );
  }
}

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
                color: Colors.black,
              ))),
        ),
      ),
    );
  }
}
