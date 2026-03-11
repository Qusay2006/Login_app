import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String username = '';
  String token = '';

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('em') ?? 'Unknown';
      token = prefs.getString('token') ?? 'No token';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             CircleAvatar(radius: 50, child: Icon(Icons.person, size: 50)),
             SizedBox(height: 20),
            Text(username, style:  TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
             SizedBox(height: 10),
            Text('Token: ${token}', style:  TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}