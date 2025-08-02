import 'package:flutter/material.dart';
import 'package:wrenchy_admin/constant/app_text_styles.dart';
import 'package:wrenchy_admin/constant/color_panel.dart';
import 'package:wrenchy_admin/screens/auth/widgets/auth_footer.dart';
import 'package:wrenchy_admin/widgets/app_logo.dart';

import '../../widgets/buttons.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              width: 500,
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 20,
                    spreadRadius: 4,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppLogo(width: 130),
                  SizedBox(height: 20),
                  Text(
                    'Create an Account',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Full Name',
                      labelStyle: TextStyle(color: Colors.grey[600]),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person, color: ColorPanel.secondaryColor),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                      labelStyle: TextStyle(color: Colors.grey[600]),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email, color: ColorPanel.secondaryColor),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.grey[600]),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock, color: ColorPanel.secondaryColor),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      labelStyle: TextStyle(color: Colors.grey[600]),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock, color: ColorPanel.secondaryColor),
                    ),
                  ),
                  SizedBox(height: 30),
                  PrimaryButton(
                    onTap: () {
                      Navigator.pop(context);

                    },
                    title: 'Sign Up',
                  ),
                  SizedBox(height: 20),
                  AuthFooter(
                    title: 'Already have an account? ',
                    pageName: "Login",
                    onTap: (){
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

