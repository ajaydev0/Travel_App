import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/app/const/const.dart';
import '../../../widgets/KText.dart';
import '../controllers/profile_page_controller.dart';

class ProfilePageView extends GetView<ProfilePageController> {
  const ProfilePageView({super.key});
  @override
  Widget build(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser;
    var controller = Get.put(ProfilePageController());
    return Scaffold(
      key: controller.globalKey,
      endDrawer: SafeArea(child: KEndDrawer(controller, context)),
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,

        // leading: BackButton(
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        //   color: Colorsys.grey,
        // ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              controller.globalKey.currentState?.openEndDrawer();
            },
            icon: const Icon(Icons.settings, size: 25, color: Colors.black),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15)),
                  color: Colors.white),
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 5),
                   Hero(
                    transitionOnUserGestures: true,
                    tag: "ajay",
                    child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Kcolor.black,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade300,
                                  blurRadius: 20,
                                  offset: const Offset(0, 10))
                            ]),
                        child: 
                        user!.photoURL != null ? 
                         CircleAvatar(
                          backgroundImage: NetworkImage(user!.photoURL ?? ""),
                          maxRadius: 40,
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Container(
                                  alignment: Alignment.center,
                                  height: 15,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    color: Kcolor.black,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.edit,
                                    size: 12,
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        ): CircularProgressIndicator()
                        )  ,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Ktext(
                    text: user.displayName ?? "Null Name",
                    fontSize: 22,
                    color: Kcolor.black,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Ktext(
                    text: user.email,
                    fontSize: 14,
                    color: Colors.grey.shade500,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  makeActionButtons(),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  ListTile(
                    onTap: () {},
                    title: Ktext(
                        text: "Account Setting", color: Colors.grey.shade600),
                    leading: Icon(
                      Icons.person_pin_outlined,
                      color: Colors.grey.shade600,
                    ),
                    trailing: const Icon(Icons.keyboard_arrow_right_outlined),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35),
                    child: Divider(),
                  ),
                  ListTile(
                    onTap: () {},
                    title: Ktext(
                        text: "Change Password", color: Colors.grey.shade600),
                    leading: Icon(
                      Icons.lock_open_outlined,
                      color: Colors.grey.shade600,
                    ),
                    trailing: const Icon(Icons.keyboard_arrow_right_outlined),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35),
                    child: Divider(),
                  ),
                  ListTile(
                    onTap: () {},
                    title: Ktext(text: "Language", color: Colors.grey.shade600),
                    leading: Icon(
                      Icons.language,
                      color: Colors.grey.shade600,
                    ),
                    trailing: Icon(
                      Icons.keyboard_arrow_right_outlined,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35),
                    child: Divider(),
                  ),
                  ListTile(
                    onTap: () {},
                    title: Ktext(text: "Help", color: Colors.grey.shade600),
                    leading: Icon(
                      Icons.help_outline,
                      color: Colors.grey.shade600,
                    ),
                    trailing: const Icon(Icons.keyboard_arrow_right_outlined),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget makeActionButtons() {
    return Transform.translate(
      offset: const Offset(0, 5),
      child: Container(
        height: 65,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 90),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            // color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 20,
                  offset: const Offset(0, 10))
            ]),
        child: Row(
          children: <Widget>[
            Expanded(
              child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  height: double.infinity,
                  elevation: 0,
                  onPressed: () {},
                  color: Kcolor.black,
                  child: Ktext(
                    text: "Edit Profile",
                    color: Colors.white,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

Widget KEndDrawer(
  ProfilePageController controller,
  BuildContext context,
) {
  return Drawer(
    // width: Kw(value: 70, context: context),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Card(
          child: ListTile(
            title: Padding(
              padding: const EdgeInsets.only(
                right: 80,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      //close Drawer
                      controller.globalKey.currentState?.closeEndDrawer();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Kcolor.black,
                    ),
                  ),
                  Ktext(
                    text: "Settings",
                    fontSize: 22,
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Divider(
            thickness: 2,
            color: Colors.grey.shade300,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Card(
            child: ListTile(
              title:
                  Ktext(text: "Account Setting", color: Colors.grey.shade600),
              leading: CircleAvatar(
                backgroundColor: Kcolor.black,
                child: Icon(
                  Icons.settings,
                  size: 20,
                  color: Kcolor.white,
                ),
              ),
              onTap: () {},
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Card(
            child: ListTile(
              title: Ktext(text: "My Order", color: Colors.grey.shade600),
              leading: CircleAvatar(
                backgroundColor: Kcolor.black,
                child: Icon(
                  Icons.create,
                  size: 20,
                  color: Kcolor.white,
                ),
              ),
              onTap: () {},
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Card(
            child: ExpansionTile(
              title: Ktext(text: "Appearance", color: Colors.grey.shade600),
              leading: CircleAvatar(
                backgroundColor: Kcolor.black,
                child: Icon(
                  Icons.color_lens,
                  size: 20,
                  color: Kcolor.white,
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 5,
                    bottom: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Get.find<MyAppController>().lightMode();
                              // Get.changeThemeMode(ThemeMode.light);
                              // Get.changeTheme(ThemeData.light());

                              print("LightMode");
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Kcolor.black,
                                  borderRadius: BorderRadius.circular(20)),
                              height: 50,
                              width: 50,
                              child: const Icon(
                                Icons.light_mode,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Ktext(text: "Light", color: Colors.grey.shade600),
                        ],
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Get.find<MyAppController>().darkMode();
                              // controller.theme.value = false;
                              // Get.changeThemeMode(ThemeMode.dark);
                              // box.value.write("themeData", ThemeData());
                              // Get.changeTheme(ThemeData.dark());

                              print("DarkMode");
                              // print(KData.themeData);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(.3),
                                  borderRadius: BorderRadius.circular(20)),
                              height: 50,
                              width: 50,
                              child: const Icon(
                                Icons.dark_mode,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Ktext(text: "Dark", color: Colors.grey.shade600),
                        ],
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Get.changeThemeMode(ThemeMode.system);
                              print("SystemThemeMode");
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(.3),
                                  borderRadius: BorderRadius.circular(20)),
                              height: 50,
                              width: 50,
                              child: const Icon(
                                Icons.settings_suggest,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Ktext(text: "System", color: Colors.grey.shade600),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Card(
            child: ListTile(
              title: Ktext(text: "Chat with Us", color: Colors.grey.shade600),
              // subtitle: Text("Feel Free to Contact Us"),
              leading: CircleAvatar(
                backgroundColor: Kcolor.black,
                child: Icon(
                  Icons.headset_mic_outlined,
                  size: 20,
                  color: Kcolor.white,
                ),
              ),

              onTap: () {},
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Card(
            child: ListTile(
              title: Ktext(text: "Help Center", color: Colors.grey.shade600),
              leading: CircleAvatar(
                backgroundColor: Kcolor.black,
                child: Icon(
                  Icons.question_mark,
                  size: 20,
                  color: Kcolor.white,
                ),
              ),
              onTap: () {
                // Get.offAllNamed(Routes.signInScreen);
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Divider(
            thickness: 2,
            color: Colors.grey.shade300,
          ),
        ),
        Card(
          color: Colors.white,
          child: ListTile(
            title: Ktext(text: "Log Out", color: Colors.grey.shade600),
            leading: CircleAvatar(
              backgroundColor: Kcolor.black,
              child: Icon(
                Icons.logout,
                size: 20,
                color: Kcolor.white,
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward,
              color: Colors.grey.shade300,
            ),
            onTap: () {
              controller.logOutDialogBox(context);
            },
          ),
        ),
      ],
    ),
  );
}
