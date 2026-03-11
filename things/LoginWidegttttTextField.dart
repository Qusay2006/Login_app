import 'package:flutter/material.dart';

import '../pages/login_page.dart';
class Loginwidegtttttextfield extends StatelessWidget {
  const Loginwidegtttttextfield({super.key,
  required this.obs , required this.hint,required this.vakida,required this.savedd,required this.controller});
  final bool obs ;
  final String hint;
  final String? Function(String?) vakida;
  final Function(String?) savedd;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(obscureText: obs,decoration: InputDecoration(hintText: hint),
      validator: vakida,
      onSaved: savedd,
      controller: controller,
    );
  }
}
