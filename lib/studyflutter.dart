import 'dart:ui';

import 'package:flutter/material.dart';

class MyApp2 extends StatelessWidget {

  const MyApp2({Key?key}):super(key: key);
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
class MyHomePageState extends State<MyHomePage>{
  int dem = 0;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Trang chu"),
        leading: Icon(Icons.home),
        actions: [
          IconButton(onPressed: (){
            var snack = SnackBar(content: Text("Hello"));
            ScaffoldMessenger.of(context).showSnackBar(snack);
          },
              icon: Icon(Icons.add_alert_rounded)),
          IconButton(onPressed: (){}, icon: Icon(Icons.logout)),
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
            children: [
              Image.network("https://static2.yan.vn/YanNews/2167221/201905/cuoc-doi-va-su-nghiep-cua-hot-girl-com-nguoi-ribi-sachi-8c8b3ffc.jpg"),
              Image.network("https://th.bing.com/th/id/R.b53b45919138c50b0dd0773f8ff2dde8?rik=3L7%2f6QNnx4Pr%2fg&pzz  id=ImgRaw&r=0"),
              Text("Dem: $dem", style: TextStyle(fontSize: 30),),
            ],
          )

      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.amber,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: (){
                },
                icon: Icon(Icons.call,size: 50,color: Colors.green,)
            ),
            IconButton(
                onPressed: (){

                },
                icon: Icon(Icons.place,size: 50,color: Colors.red,)
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            dem++;
            print(dem);
          });
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

}