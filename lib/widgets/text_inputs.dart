import 'package:flutter/material.dart';

import '../constant/color_panel.dart';

class CustomTextInput extends StatelessWidget {
  final String label;
  final TextEditingController ? controller;
  final IconData prefixIcon;
  final bool obscureText;
  const CustomTextInput({
    super.key, required this.label, this.controller, required this.prefixIcon,this.obscureText = false
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey[600]),
        border: OutlineInputBorder(),
        prefixIcon: Icon(prefixIcon, color: ColorPanel.secondaryColor),
      ),
    );
  }
}
