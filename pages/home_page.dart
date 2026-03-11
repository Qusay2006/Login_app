import 'package:flutter/material.dart';

import '../things/hero_widget.dart';
import 'course_page.dart';
import 'login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Column( children: [
          GestureDetector(child: HeroWidget(title: "Click"),onTap: () {
            Navigator.push(context,MaterialPageRoute(builder: (context) {
              return CoursePage();
            },));
          },)
        ],),
      ),
    );
  }
}
