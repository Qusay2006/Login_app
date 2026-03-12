import 'package:flutter/material.dart';
import 'package:untitled8/pages/welcom_page.dart';
import 'package:untitled8/things/notifier.dart';


void main(){
  runApp(const Main());
}


class Main extends StatelessWidget {
  const Main({super.key});
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ISDark,
      builder: (context, value, child) {
        return MaterialApp(debugShowCheckedModeBanner: false,
        theme: ThemeData(colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue,
            brightness:value==true? Brightness.dark:Brightness.light)),
               home: WelcomPage(),
        );
      }
    );
  }
}
