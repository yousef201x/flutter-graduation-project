import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app_project/authentication/login/forget_password_screen.dart';
import 'package:movies_app_project/authentication/login/login_screen.dart';
import 'package:movies_app_project/authentication/register/register_screen.dart';
import 'package:movies_app_project/home/home_screen.dart';
import 'package:movies_app_project/onboarding_screen/onboarding_screen.dart';
import 'package:movies_app_project/utils/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.onBoardingScreenRouteName,
      routes:{
        AppRoutes.onBoardingScreenRouteName : (context) => OnBoardingScreen(),
        AppRoutes.homeScreenRouteName : (context) => HomeScreen(),
        AppRoutes.loginRouteName : (context) => LoginScreen(),
        AppRoutes.registerRouteName : (context) => RegisterScreen(),
        AppRoutes.forgetPasswordRouteName : (context) => ForgetPasswordScreen()
      }
    );
  }
}