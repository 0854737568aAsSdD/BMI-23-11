import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'user.dart';
import 'package:http/http.dart' as http;

class MyBT4 extends StatelessWidget {
  const MyBT4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyProfile(),
    );
  }
}

class MyProfile extends StatefulWidget {

  const MyProfile({Key? key}) : super(key: key);

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {

  late Future<User> user;
  var txtFirst = TextEditingController();
  var txtLast = TextEditingController();
  var txtEmail = TextEditingController();
  var txtPhone= TextEditingController();
  var txtCell = TextEditingController();
  var txtGender = TextEditingController();
  var txtStreet = TextEditingController();
  var txtCity = TextEditingController();
  var txtState = TextEditingController();
  var txtCountry = TextEditingController();


  Column cL(String label, String hint, TextEditingController txtController, String text)
  {
    txtController.text = text;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            color: Colors.white,
            child: TextField(
              controller: txtController,
              decoration: InputDecoration(
                // border: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(12),
                // ),
                hintText: hint,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Center(child: Text("Profile")),
      ),
      body: FutureBuilder(
        future: user,
        builder: (context, snapshot) {
          if(snapshot.hasData)
          {
            var data = snapshot.data as User;
            return ListView(
              children: [
                Container(
                  height: 150,
                  width: 150,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(data.results[0].picture.medium.toString()),
                  ),
                ),
                Container(
                  color: Colors.grey,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Form(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            cL("First Name", "First Name*",txtFirst,data.results[0].name.first),
                            cL("Last Name", "Last Name*",txtLast,data.results[0].name.last),
                            cL("Gender","Gender",txtGender,data.results[0].gender),
                            cL("Company Email", "Company Email*",txtEmail,data.results[0].email),
                            cL("Phone", "Phone*",txtPhone,data.results[0].phone),
                            cL("Cell", "Cell*",txtCell,data.results[0].cell),
                            cL("Street", "Street*", txtStreet, data.results[0].location.street.number.toString()+', '+data.results[0].location.street.name),
                            cL("City", "City*", txtCity, data.results[0].location.city),
                            cL("State", "State*", txtState, data.results[0].location.state),
                            cL("Country", "Country*", txtCountry, data.results[0].location.country),
                          ],
                        )
                    ),
                  ),
                ),
              ],
            );
          }else
          {
            return CircularProgressIndicator();
          }
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: (){},
                icon: Icon(Icons.account_balance_wallet)
            ),
            IconButton(
                onPressed: (){},
                icon: Icon(Icons.list_alt)
            ),
            IconButton(
                onPressed: (){},
                icon: Icon(Icons.person_pin)
            ),
            IconButton(
                onPressed: (){},
                icon: Icon(Icons.doorbell)
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(

        //thực hiện khi nhấn
        onPressed: (){
          //refresh màn hình
          setState(() {
          });
        },
        child: Text("Save"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }

  static Future<User> fetchData() async{
    String url = "https://randomuser.me/api/";
    var client = http.Client();
//lấy dữ liệu về
    var response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var result = response.body;
      var jsonData = jsonDecode(result);
      print(User.fromJson(jsonData).results[0].email.toString());
      return User.fromJson(jsonData);
    }
    else
    {
      throw Exception("Lỗi lấy dữ liệu: ${response.statusCode}");
    }

  }

}
