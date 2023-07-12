import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kamppus_merdeka/controller/controller.dart';
import 'package:kamppus_merdeka/widget/list_container.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DataController());
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.symmetric(vertical: 14, horizontal: 24),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios),
                ),
                Text(
                  'Second Screen',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(
                  width: 10,
                )
              ],
            ),
            SizedBox(
              height: 75,
            ),
            // Obx(() => ...List.from(controller.users.value.map(())))
            Obx(() => Column(
                  children: [
                    // ListContainer(dataList: )
                    ...List.from(controller.users.map((e) => ListContainer(e))),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
