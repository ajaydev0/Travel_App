import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../router/app_pages.dart';

class SignupPageController extends GetxController {
  // @override
  // void onInit() {

  //   super.onInit();
  // }

  RxBool isLoading = false.obs;
  RxBool isVisible = false.obs;
  RxBool isPasswordEightCharacters = false.obs;
  RxBool hasPasswordOneNumber = false.obs;
  late final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController name = TextEditingController();
  late TextEditingController email = TextEditingController();
  late TextEditingController pass = TextEditingController();

  // Validate Name TextFormFeild
  validateName(value) {
    if (value == null || value.isEmpty) {
      return " Requied";
    }
    return null;
  }

  // Validate Email TextFormFeild
  validateEmail(value) {
    if (value == null || value.trim().isEmpty) {
      return " Required";
    }
    if (!value.trim().contains("@gmail.com") && !value.trim().contains("@yahoo.com")) {
      return "Email is not valid";
    }
    // if (!value.trim().contains("@gmail.com")) {
    //   return "Enter valid email";
    // }
    return null;
  }

  // Validate Password TextFormFeild
  validatePass(value) {
    if (value == null || value.isEmpty) {
      return " Requied";
    }
    if (isPasswordEightCharacters.value != true) {
      return "Requied 8 characters";
    }
    if (hasPasswordOneNumber.value != true) {
      return "Requied 1 number";
    }
    // if (!value.trim().contains("@")) {
    //   return "Enter Strong Password (@)";
    // }

    return null;
  }

  onPasswordChanged(String password) {
    final numericRegex = RegExp(r'[0-9]');
    isPasswordEightCharacters.value = false;
    if (password.length >= 8) isPasswordEightCharacters.value = true;

    hasPasswordOneNumber = false.obs;
    if (numericRegex.hasMatch(password)) hasPasswordOneNumber.value = true;
  }

  onClickCreateAccount() async {
    if (formKey.currentState!.validate()) {
      try {
        isLoading.value = true;
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: email.text, password: pass.text,);
        if (userCredential.user != null) {
          Get.offAllNamed(Routes.login_Page);
          Get.snackbar("Success", "User Added SuccessFul",
              backgroundColor: Colors.black.withOpacity(.1));
        }
        // isLoading.value = false;
      } on FirebaseAuthException catch (e) {
        if (kDebugMode) {
          print(e);
        }
        Get.snackbar(
            "Error", "User already have an Account ! \nTry another Email",
            backgroundColor: Colors.black.withOpacity(.1));
        isLoading.value = false;
      }
    }
  }
}
