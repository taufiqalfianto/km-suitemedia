import 'package:flutter/material.dart';
import 'package:kamppus_merdeka/pages/third_screen.dart';

import 'package:get/get.dart';
import 'package:kamppus_merdeka/controller/controller.dart';

class SecondScreen extends StatelessWidget {
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: GestureDetector(
        onTap: () {
          // Navigate to the third screen
          Get.to(() => ThirdScreen());
        },
        child: Container(
          width: 360,
          height: 41,
          decoration: ShapeDecoration(
            color: Color(0xFF2A637B),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Center(
            child: Text(
              'Choose a User',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(
          'Second Screen',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 20),
        child: Column(
          children: [
            Text(
              'Welcome',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Obx(
              () => Text(
                '${userController.users.isNotEmpty ? userController.users[0].firstName : ""} ${userController.users.isNotEmpty ? userController.users[0].lastName : ""}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              child: userController.users.isEmpty
                  ? SizedBox(
                      height: 300,
                      child: Center(
                        child: Text(
                          'Selected Username',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 32,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    )
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }
}
