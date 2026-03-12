import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../things/usersin.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}
late UserModel userModel;

class _CoursePageState extends State<CoursePage> {

  List<UserModel>dc =[];

  Future dataCall()async{
    var url = Uri.parse("https://randomuser.me/api/?results=10");
    var response =await http.get(url);
    if(response.statusCode ==200) {
      var map = jsonDecode(response.body) as Map<String, dynamic>;
      final List result = map['results'];
      for (var infoaaa in result) {
        dc.add(UserModel.fromJson(infoaaa));
      }
      return dc;
    }
    else {
      print("object");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(shape: UnderlineInputBorder(),),
      body: FutureBuilder(future: dataCall(), builder: (context, snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        else if(snapshot.hasError){
          return Text('Error404');
        }

        return ListView.builder(itemCount: dc.length,
          itemBuilder: (context, index) {
            var user = dc[index];
            return ListTile(title: Text(user.firstName),
              subtitle: Text(user.lastName),);
          },
        );

      },),
    );

  }
}
