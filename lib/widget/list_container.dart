import 'package:flutter/material.dart';
import 'package:kamppus_merdeka/model/model.dart';

class ListContainer extends StatefulWidget {
  final Data data;
  ListContainer(this.data);

  @override
  State<ListContainer> createState() => _ListContainerState();
}

class _ListContainerState extends State<ListContainer> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 335,
        height: 80,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Image.asset(
                'widget.data.data.toString(),',
                scale: 0.2,
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'widget.data.data.toString(),',
                    style: TextStyle(
                      color: Color(0xFF04021D),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    widget.data.email.toString(),
                    style: TextStyle(
                      color: Color(0xFF686777),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
 