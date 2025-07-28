import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  final double width;
  const AppLogo({
    super.key,  this.width = 200,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/Logo.png', width: width);
  }
}
