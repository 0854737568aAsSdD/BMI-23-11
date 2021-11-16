import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
class MyApp3 extends StatelessWidget {
  const MyApp3({Key? key}) : super(key: key);

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
  Iterable<WordPair> data = generateWordPairs().take(10);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("Danh sách cơ bản"),
          leading: Icon(Icons.line_style),
        ),
        body:ListView.builder(
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index){
              WordPair word = data.elementAt(index);
              return Card(
                elevation: 0,
                child: ListTile(

                  title: Text(word.asPascalCase),
                  leading: CircleAvatar(

                      child: Text((index+1).toString(), style: TextStyle(color: Colors.white)),
                      backgroundColor: Colors.orange,
                  ),


                  trailing: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
                      IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
                      

                    ],
                  )
                ),
              );
            }
        )

    );
  }

}