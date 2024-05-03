import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../../../router/app_pages.dart';

class LoginPageController extends GetxController {
  //
  RxBool isLoading = false.obs;
  RxBool isVisible = false.obs;
  RxBool isPasswordEightCharacters = false.obs;
  RxBool hasPasswordOneNumber = false.obs;
  //
  late final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController email = TextEditingController();
  late TextEditingController pass = TextEditingController();

  // Validate Email TextFormFeild
  validateEmail(value) {
    if (value == null || value.trim().isEmpty) {
      return " Required";
    }
    if (!value.trim().contains("@") || !value.trim().contains(".com")) {
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

  //Validate leanth or number
  onPasswordChanged(String password) {
    final numericRegex = RegExp(r'[0-9]');

    isPasswordEightCharacters.value = false;
    if (password.length >= 8) isPasswordEightCharacters.value = true;

    hasPasswordOneNumber = false.obs;
    if (numericRegex.hasMatch(password)) hasPasswordOneNumber.value = true;
  }

  Future<dynamic> onClickLogIn() async {
    var conectivityResult = await (Connectivity().checkConnectivity());

    if (formKey.currentState!.validate()) {
      if (conectivityResult == ConnectivityResult.mobile ||
          conectivityResult == ConnectivityResult.wifi) {
        try {
          isLoading.value = true;
          UserCredential userCredential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: email.text, password: pass.text);
          if (userCredential.user != null) {
              Get.offAllNamed(Routes.nav_Bar);
          }
          isLoading.value = false;
        } on FirebaseAuthException catch (e) {
          if (kDebugMode) {
            print(e);
          }
          Get.snackbar("Error", "User Not Found",
              backgroundColor: Colors.black.withOpacity(.1));
          isLoading.value = false;
        }
      } else {
        print("No Internet Connected");
        Get.snackbar("Error", "No Internet Connected",
            backgroundColor: Colors.black.withOpacity(.1));
        return null;
      }
    }
  }

  Future<dynamic> signInWithGoogle() async {
    var conectivityResult = await (Connectivity().checkConnectivity());

    if (conectivityResult == ConnectivityResult.mobile ||
        conectivityResult == ConnectivityResult.wifi) {
      try {
        isLoading.value = true;
        // Create Instance
        FirebaseAuth auth = FirebaseAuth.instance;
        final GoogleSignIn googleSignIn = GoogleSignIn();
        //
        final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
        //
        final GoogleSignInAuthentication googleAuth =
            await googleUser!.authentication;
        //Create New Credentials
        final AuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
        // signin user with credentials
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);
        Get.offAllNamed(Routes.nav_Bar);
        isLoading.value = false;
      } on FirebaseAuthException catch (e) {
        if (kDebugMode) {
          print(e);
        }
        Get.snackbar("Error", "Something Wrong",
            backgroundColor: Colors.black.withOpacity(.1));
        isLoading.value = false;
      }
    } else {
      print("No Internet Connected");
      Get.snackbar("Error", "No Internet Connected",
          backgroundColor: Colors.black.withOpacity(.1));
      return null;
    }
  }



facebookSignIn(){
  Get.snackbar("Working", "Coming Soon...",
          backgroundColor: Colors.black.withOpacity(.1));

}
githubSignIn(){
  Get.snackbar("Working", "Coming Soon...",
          backgroundColor: Colors.black.withOpacity(.1));

}

}
