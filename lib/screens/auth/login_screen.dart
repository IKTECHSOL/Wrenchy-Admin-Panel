import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrenchy_admin/constant/app_text_styles.dart';
import 'package:wrenchy_admin/constant/color_panel.dart';
import 'package:wrenchy_admin/screens/auth/signup_screen.dart';
import 'package:wrenchy_admin/screens/auth/widgets/auth_footer.dart';
import 'package:wrenchy_admin/widgets/app_logo.dart';

import '../../widgets/buttons.dart';
import '../../widgets/text_inputs.dart';
import '../main_screen.dart';
import 'forgot_password_screen.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                  AppLogo(width: 130,),
                  SizedBox(height: 20),
                  Text(
                    'Welcome Back!',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  SizedBox(height: 20),
                  CustomTextInput(
                    prefixIcon: Icons.email,
                    label: 'Email Address',

                  ),
                  SizedBox(height: 20),
                  CustomTextInput(
                    prefixIcon: Icons.lock,
                    label: 'Password',
                    obscureText: true,

                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(onPressed: (){
                      Get.to(()=>ForgotPasswordScreen());
                    }, child: Text("Forgot Password?",style: AppTextStyles.medium.copyWith(color: ColorPanel.secondaryColor),)),
                  ),
                  SizedBox(height: 30),
                  PrimaryButton(
                    onTap: () {
                      Get.to(()=>MainScreen());

                    },
                    title: "Login",
                  ),
                  SizedBox(height: 20),
                  AuthFooter(
                    title: 'Don\'t have an account? ',
                    pageName: 'Sign Up',
                    onTap: (){
                     Get.to(()=>SignupScreen());
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

