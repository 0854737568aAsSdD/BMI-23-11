import 'package:flutter/material.dart';

class MyApp6 extends StatelessWidget {
  const MyApp6({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MetarialApp',
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget{
  const MyHomePage({Key?key}):super(key: key);
  @override
  MyHomePageState createState() => MyHomePageState();
}
class MyHomePageState extends State<MyHomePage>
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar  (
        title: const Text("Foody VietNam"),
      ),

    );

    throw UnimplementedError();
  }

}