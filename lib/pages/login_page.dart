import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../things/LoginWidegttttTextField.dart';
import '../things/textcolors.dart';
import '../things/validationnn.dart';
import 'widget_tree.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emcontrol = TextEditingController();
  final TextEditingController pscontrol = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? username;
  String? password;
  bool isLoading = false;

  @override
  void dispose() {
    emcontrol.dispose();
    pscontrol.dispose();
    super.dispose();
  }

  Future<String?> sendData() async {
    var url = Uri.parse('https://fakestoreapi.com/auth/login');
    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username, 'password': password}),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      var result = jsonDecode(response.body);
      return result['token'];
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.network(
              'https://assets2.lottiefiles.com/packages/lf20_jcikwtux.json',
              height: 200,
              width: 200,
            ),
            Loginwidegtttttextfield(
              controller: emcontrol,
              obs: false,
              hint: 'Username',
              vakida: (value) {
                if (value == null || value.isEmpty) return 'Enter username';
                return null;
              },
              savedd: (val) => username = val,
            ),
            Loginwidegtttttextfield(
              controller: pscontrol,
              obs: true,
              hint: 'Password',
              vakida: (value) {
                if (value == null || value.isEmpty) return 'Enter password';
                if (!value.isPassValid) return 'Password must contain a special character';
                return null;
              },
              savedd: (val) => password = val,
            ),
            const SizedBox(height: 20),
            isLoading
                ? const CircularProgressIndicator()
                : FilledButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  setState(() => isLoading = true);
                  var token = await sendData();
                  setState(() => isLoading = false);
                  if (token != null) {
                    SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                    prefs.setString('token', token);
                    prefs.setString('username', username?? '');
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WidgetTree()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Login failed')),
                    );
                  }
                }
              },
              child: const Text("Login", style: extcolors.Blackstyl),
            ),
          ],
        ),
      ),
    );
  }
}