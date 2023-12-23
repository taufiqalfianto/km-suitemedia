import 'package:flutter/material.dart';
import 'package:kamppus_merdeka/controller/controller.dart';
import 'package:kamppus_merdeka/model/model.dart';

import 'package:get/get.dart';

class ThirdScreen extends StatelessWidget {
  final UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Third Screen',
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
      body: RefreshIndicator(
        onRefresh: () async {
          userController.users.clear();
          await userController.fetchUsers();
        },
        child: ListView.builder(
          itemCount: userController.users.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Center(
                child: Container(
                  width: 335,
                  height: 80,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.network(
                            userController.users[index].avatar,
                            // scale: ,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              '${userController.users[index].firstName} ${userController.users[index].lastName}',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '${userController.users[index].email}',
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              onTap: () {
                userController.users.add(
                  UserModel(
                    email: '',
                    firstName: userController.users[index].firstName,
                    lastName: userController.users[index].lastName,
                    avatar: '',
                  ),
                );
                Get.back();
              },
            );
          },
        ),
      ),
    );
  }
}
