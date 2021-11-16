import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class MyApp7 extends StatelessWidget {
  const MyApp7 ({Key? key}) : super(key: key);

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

class MyHomePageState extends State<MyHomePage> {
  late Future<List<Photo>> lsPhoto;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lsPhoto = Photo.fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Products"),
      ),
      body: FutureBuilder(
        future: lsPhoto,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
          if (snapshot.hasData)
          {
            var data = snapshot.data as List<Photo>;
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  mainAxisExtent: 400,
                ),
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index)
                {
                  Photo p = data[index];
                  return Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.network(p.image, height: 200, width: 150,),
                        Text(p.title),
                        Text("Giá: "+p.price.toString()),
                        //Text("Description: "+p.description),
                        Text("Category: "+p.category),
                        ElevatedButton(
                            onPressed: (){},
                            child: Icon(Icons.shopping_cart)
                        ),
                      ],
                    ),
                  );
                }
            );
          }
          else
          {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}


class Photo{
  final int id;
  final String title;
  final int price;
  final String description;
  final String category;
  final String image;
  Photo({required this.id,required this.title,required this.price,required this.description,required this.category,required this.image});

  static Future<List<Photo>> fetchData() async {
    String url = "https://fakestoreapi.com/products?limit=100";
    print(url);
    var client = http.Client();
    var reponse = await client.get(Uri.parse(url));
    print(reponse);
    if(reponse.statusCode == 200)
    {
      var result = reponse.body;
      print(result);
      var jsonData = jsonDecode(result);//.cast<List<Map<String,dynamic>>>();
      List<Photo> l = [];
      for(var item in jsonData)
      {
        Photo p = new Photo(id: item['id'], title: item['title'], price: item['price'], description: item['description'], category: item['category'], image: item['image'],);
        l.add(p);
       print(p);
      }
      return l;
    }else{
      throw Exception("Lỗi lấy dữ liệu. Chi tiết: ${reponse.statusCode}");
    }
  }

}