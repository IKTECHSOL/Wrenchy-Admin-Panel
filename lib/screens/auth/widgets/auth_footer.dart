import 'package:flutter/material.dart';

import '../../../constant/color_panel.dart';

class AuthFooter extends StatelessWidget {
  final String title,pageName;
  final VoidCallback onTap;
  const AuthFooter({
    super.key, required this.title, required this.pageName, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title),
          Text(pageName, style: TextStyle(fontWeight: FontWeight.bold, color: ColorPanel.secondaryColor)),
        ],
      ),
    );
  }
}
