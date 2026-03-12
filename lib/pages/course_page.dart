import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../things/usersin.dart';
class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}
late List<UserModel>dc = [];
class _CoursePageState extends State<CoursePage> {
 Future getData ()async{
   var url = Uri.parse('https://randomuser.me/api/?results=10');
   var response =await http.get(url);
   if(response.statusCode==200)
     {
      var map = jsonDecode(response.body) as Map<String,dynamic>;
      final List result= map['results'];

      for(var yes in result){
        dc.add(UserModel.fromJson(yes));}
      return dc;
     }
   return dc;
 }
 late Future yup = getData();
 @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(floatingActionButton: FloatingActionButton(onPressed: () {
      setState(() {
       dc.clear();
       yup= getData();
      });
      
    },child: Icon(Icons.refresh),)
      ,appBar: AppBar(actions: [

    ]),
      body:
          FutureBuilder(future: yup, builder: (context, snapshot) {
            if(snapshot.connectionState==ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
            }else if(snapshot.hasError){
              return Center(child: Text("Error4044"));
            }
            return ListView.builder(itemCount: dc.length,itemBuilder: (context, index) {
             var user = dc[index];
             return ListTile(title: Text(user.firstName) ,subtitle: Text(user.lastName),);
            },);

          },),
    );
  }
}
