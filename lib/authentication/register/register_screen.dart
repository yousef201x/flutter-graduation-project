import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movies_app_project/authentication/register/widget/Pirmary_button.dart';
import 'package:movies_app_project/authentication/register/widget/avatar_section.dart';
import 'package:movies_app_project/authentication/register/widget/language_toggle.dart';
import 'package:movies_app_project/authentication/register/widget/register_widget.dart';
import 'package:movies_app_project/authentication/register/widget/body_register.dart'; // تأكد أن CustomTextField هنا
import 'package:movies_app_project/utils/app_colors.dart';
import 'package:movies_app_project/utils/app_routes.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: MyBar(title: 'Register'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AvatarSection(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  CustomTextField(
                    hintText: 'Name',
                    image: 'assets/images/icon _Identification_.png',
                  ),
                  SizedBox(height: 16),
                  CustomTextField(
                    hintText: 'Email',
                    image: 'assets/images/Vector.png',
                  ),
                  SizedBox(height: 16),
                  CustomTextField(
                    hintText: "Password",
                    image: "assets/images/passsword.png",
                    obscureText: _obscurePassword,
                    showSuffixIcon: true,
                    toggleObscure: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                  SizedBox(height: 16),
                  CustomTextField(
                    hintText: "Confirm Password",
                    image: "assets/images/passsword.png",
                    obscureText: _obscureConfirmPassword,
                    showSuffixIcon: true,
                    toggleObscure: () {
                      setState(() {
                        _obscureConfirmPassword = !_obscureConfirmPassword;
                      });
                    },
                  ),
                  SizedBox(height: 16),
                  CustomTextField(
                    hintText: 'Phone Number',
                    image: 'assets/images/phon.png',
                  ),
                  SizedBox(height: 16),
                  PrimaryButton(
                    text: "Create Account",
                    onPressed: () {},
                  ),
                  SizedBox(height: 16),
                  RichText(
                    text: TextSpan(
                      text: "Already Have Account ? ",
                      style: TextStyle(color: Colors.grey),
                      children: [
                        TextSpan(
                          text: "Login",
                          style: TextStyle(
                            color: AppColors.yellowColor,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushReplacementNamed(
                                context,
                                AppRoutes.loginRouteName,
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 25),
                  LanguageToggle(),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}