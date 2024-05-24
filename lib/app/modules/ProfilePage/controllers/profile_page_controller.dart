import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../const/get_Storage..dart';
import '../../../router/app_pages.dart';
import '../widget/logOut_Box.dart';

class ProfilePageController extends GetxController {
  //Key
  final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  
  //LogOut Dialog Box
  logOutDialogBox(
    context,
  ) {
    return showDialog(
      // barrierDismissible: false,
      context: context,
      builder: (context) {
        return logOutBox(context);
      },
    );
  }

  logout() async {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.login_Page);
    box.value.remove("User");
  }
}
