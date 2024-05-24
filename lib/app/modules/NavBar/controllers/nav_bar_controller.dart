import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ProfilePage/views/profile_page_view.dart';
import '../../homePage/views/home_page_view.dart';


class NavBarController extends GetxController {
  RxInt currentindex = 0.obs;

  List pages = [
    const HomePageView(),
    Container(color: Colors.green),
    Container(color: Colors.green),
    const ProfilePageView()
  ];
}
