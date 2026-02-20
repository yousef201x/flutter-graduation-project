import 'package:flutter/material.dart';
import 'package:movies_app_project/authentication/register/widget/Pirmary_button.dart';
import 'package:movies_app_project/authentication/register/widget/avatar_section.dart';
import 'package:movies_app_project/authentication/register/widget/body_register.dart';
import 'package:movies_app_project/authentication/register/widget/language_toggle.dart';
import 'package:movies_app_project/authentication/register/widget/register_widget.dart';
import 'package:movies_app_project/utils/app_colors.dart';


class RegisterScreen extends StatefulWidget  {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
    bool _obscurePassword = true;
  // ignore: unused_field
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: MyBar(title: 'Register'),
      body: SingleChildScrollView(
        child: Column(
            children:  [
              AvatarSection(),
              Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0,),
          child: Column(
            children: [
              CustomTextField(hintText: 'Name', image: 'assets/images/icon _Identification_.png'),
              SizedBox( height: 10),
              CustomTextField(hintText: 'Email', image: 'assets/images/Vector.png'),
                SizedBox( height: 10),
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
             SizedBox( height: 10),
            CustomTextField(
              hintText: "Confirm Password",
              image: "assets/images/passsword.png",
              obscureText: _obscurePassword,
              showSuffixIcon: true,
              toggleObscure: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
            ),
             SizedBox( height: 10),
            CustomTextField(hintText: 'Phone Number', image: 'assets/images/phon.png'),
            SizedBox( height: 10),
             PrimaryButton(
               text: "Create Account",
               onPressed: () { },
                      ),
            
                  const SizedBox(height: 20),

                  RichText(
                    text: const TextSpan(
                      text: "Already Have Account ? ",
                      style: TextStyle(color: Colors.grey),
                      children: [
                        TextSpan(
                          text: "Login",
                          style: TextStyle(
                            color: AppColors.yellowColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  /// Language Switch
                  const LanguageToggle(),

                  const SizedBox(height: 30)
          
            
          
            ],
             
              ),
              ),
            ],
          ),
      ),
    );
  }
}
