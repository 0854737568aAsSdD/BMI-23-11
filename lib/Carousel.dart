
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MyApplication extends StatelessWidget {

  const MyApplication({Key?key}):super(key: key);
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'MetarialApp',
      home: MyApp(),
    );
  }
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Carousel Slider',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Carousel Slider Example'),
        ),
        body: CarouselSlider(
          items: [
            Padding(
              padding: const EdgeInsets.all(20.0),
           child: Image.asset('Image/agribank.png'),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset('Image/bac a bank.jpg'),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset('Image/download.png'),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset('Image/Mbbank.png'),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset('Image/vietcombank.png'),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset('Image/Mbbank.png'),
            ),
          ],
          //Slider Container properties
          options: CarouselOptions(
            autoPlay: true,
          ),
        ),
      ),
    );
  }
}