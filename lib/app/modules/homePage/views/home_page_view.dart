import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_page_controller.dart';

class HomePageView extends GetView<HomePageController> {
  const HomePageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var AppHeight = (MediaQuery.of(context).size.height) / 100;
    var AppWidth = (MediaQuery.of(context).size.width) / 100;
    return Scaffold(
        // backgroundColor: Color.fromARGB(255, 172, 171, 171), 
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage("assets/admin3.jpg"),
                            fit: BoxFit.cover,
                          ),
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    const Row(
                      children: [
                        SizedBox(width: 10),
                        Text(
                          "Hello",
                          style: TextStyle(fontSize: 15),
                        ),
                        Text(
                          ", Ajay",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Text(
              //   "Find your next trip",
              //   style: TextStyle(fontSize: 13),
              // ),
              const Padding(
                padding: EdgeInsets.only(top: 30, left: 10, right: 10),
                child: Text(
                  "Explore New Destination",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Material(
                    borderRadius: BorderRadius.circular(50),
                    elevation: 10,
                    child: Container(
                        height: 50,
                        width: AppWidth * 85,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            // border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(50)),
                        child: Row(
                          children: [
                            const SizedBox(width: 10),
                            const Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 10),
                            const Expanded(
                                child: TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Search...",
                                  hintStyle: TextStyle(color: Colors.grey)),
                            )),
                            Container(
                              alignment: Alignment.center,
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(50)),
                              child: const Icon(Icons.menu,size: 18,),
                            ),
                            const SizedBox(width: 8),
                          ],
                        )),
                  ),
              
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30, left: 0, right: 0),
                child: Text(
                  "Catagories",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),

            ],
          ),
        ));
  }
}
