import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../things/notifier.dart';
import '../things/textcolors.dart';
import 'home_page.dart';
import 'login_page.dart';
import 'profile_page.dart';
import 'welcom_page.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  final List<Widget> pages = [
    const HomePage(),
    const ProfilePage(),
  ];
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    loadTheme();
  }

  void loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    ISDark.value = prefs.getBool(extcolors.Keyy) ?? false;
  }

  void handleLogout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const WelcomPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter App", style: extcolors.Blackstyl),
        centerTitle: true,
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            onPressed: () async {
              ISDark.value = !ISDark.value;
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setBool(extcolors.Keyy, ISDark.value);
            },
            icon: ValueListenableBuilder(
              valueListenable: ISDark,
              builder: (context, value, child) {
                return Icon(value ? Icons.dark_mode_outlined : Icons.light_mode);
              },
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
            },
            child: const Text('Log in', style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
      drawer: const Drawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: handleLogout,
        shape: const CircleBorder(),
        hoverColor: Colors.red,
        child: const Text("Log Out", style: TextStyle(color: Colors.black)),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        backgroundColor: Colors.white10,
        selectedItemColor: Colors.teal,
        currentIndex: _currentIndex,
        onTap: (value) => setState(() => _currentIndex = value),
      ),
      body: pages[_currentIndex],
    );
  }
}