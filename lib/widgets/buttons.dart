import 'package:flutter/material.dart';

import '../constant/app_text_styles.dart';
import '../constant/color_panel.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onTap;
  final double width;
  final String title;
  const PrimaryButton({
    super.key, required this.onTap,  this.width = double.infinity, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 15), backgroundColor: ColorPanel.secondaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 5,
        ),
        child: Text(title, style: AppTextStyles.regular.copyWith(color: Colors.white)),
      ),
    );
  }
}
