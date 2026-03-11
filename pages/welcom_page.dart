import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_page.dart';
import 'widget_tree.dart';

class WelcomPage extends StatefulWidget {
  const WelcomPage({super.key});

  @override
  State<WelcomPage> createState() => _WelcomPageState();
}

class _WelcomPageState extends State<WelcomPage> {
  bool token = false;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    checkToken();
  }

  Future<void> checkToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.get('token') != null;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 100),
            Lottie.network(
              'https://assets7.lottiefiles.com/packages/lf20_7fCbvNSmFD.json',
              height: 400,
              width: 400,
            ),
            const SizedBox(height: 20),
            isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
              onPressed: () {
                token
                    ? Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const WidgetTree()))
                    : Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              style: ElevatedButton.styleFrom(minimumSize: const Size(340, 44)),
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}