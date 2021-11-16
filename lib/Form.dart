import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class MyApp5 extends StatelessWidget {
  const MyApp5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MetarialApp',
      home: FormBasic(),
    );
  }
}
class FormBasic extends StatefulWidget {
  const FormBasic({Key?key}) :super(key: key);

  @override
  _FormBasicState createState() => _FormBasicState();


}
class _FormBasicState extends State<FormBasic>{
  var fKey = GlobalKey<FormState>();
  var txtTenDangNhap = TextEditingController();
  var txtMatKhau = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Form(
        key: fKey,
        child: Column(
          children: [
            SizedBox(height: 200,),
            Text("Đăng nhập hệ thống", style: TextStyle(fontSize: 35, color: Colors.orange),),
            TextFormField(
              controller: txtTenDangNhap,
              validator: (value){
                if (value == null || value.isEmpty)
                  return "Vui lòng nhập tên đăng nhập";
                else
                  return null;
              },
              decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: "Tên đăng nhập",
                  labelText: "Tên đăng nhập (*)"
              ),
            ),

            TextFormField(
              controller: txtMatKhau,
              validator: (value){
                if (value == null || value.isEmpty)
                  return "Vui lòng nhập mật khẩu";
                else if (value.length < 6)
                  return  "Mật khẩu dài ít nhất là 6 ký tự";
                else
                  return null;
              },

              decoration: InputDecoration(
                  icon: Icon(Icons.lock_open),
                  hintText: "Nhập mật khẩu",
                  labelText: "Mật khẩu (*)"
              ),

            ),
            ElevatedButton(
              onPressed: (){
                if (fKey.currentState!.validate()){
                  var tendangnhap = txtTenDangNhap.text;
                  var matkhau = txtMatKhau.text;
                  tendangnhap = "123";
                  showDialog(context: context, builder: (context){
                    return AlertDialog(
                      content: Text("Tên đăng nhập: ${tendangnhap}, mật khẩu: ${matkhau}"),
                    );
                  });
                  print("Ok, , ${tendangnhap}, ${matkhau}");
                }
                else
                  print("Not pass");

              },
              child: Text("Đăng nhập"),
            ),
          ],
        ),
      ),
    );
  }
}