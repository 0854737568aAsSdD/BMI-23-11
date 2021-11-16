import 'package:flutter/material.dart';
import 'package:projecttest/CallFakeApi.dart';
import 'package:projecttest/Carousel.dart';
import 'package:projecttest/Form.dart';
import 'package:projecttest/list.basic.dart';
import 'package:projecttest/profile_basic.dart';
import 'package:projecttest/studyflutter.dart';

import 'BaiTap.dart';
import 'Foody.dart';
import 'fakeapitest.dart';

void main() {
  runApp(MyBT4());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Widget createColumn(String data, IconData icons){
    Color color = Colors.red;
    double size = 30;
    return Column(
      children: [
        Icon(
          icons,
          textDirection: TextDirection.ltr,
          color: color,
          size: size,
        ),
        Text(data,
          textDirection: TextDirection.ltr,
          style: TextStyle(
              color: color,
              fontSize: size
          ),
        )
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            textDirection: TextDirection.ltr,
            children: [
              createColumn("Call", Icons.call),
              createColumn("Route", Icons.router),
              createColumn("Share", Icons.share)

            ],
          )
      ),
      decoration: BoxDecoration(
          color: Colors.white
      ),
      padding: EdgeInsets.all(50),
    );
  }
}