import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:movies_app_project/authentication/login/forget_password_screen.dart';
import 'package:movies_app_project/authentication/login/login_screen.dart';
import 'package:movies_app_project/authentication/register/register_screen.dart';
import 'package:movies_app_project/home/home_screen.dart';
import 'package:movies_app_project/onboarding_screen/onboarding_screen.dart';
import 'package:movies_app_project/utils/app_routes.dart';
import 'package:movies_app_project/authentication/services/AuthService.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AuthService authService = AuthService();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.onBoardingScreenRouteName,
      routes: {
        AppRoutes.onBoardingScreenRouteName: (context) => const OnBoardingScreen(),
        AppRoutes.homeScreenRouteName: (context) => const HomeScreen(),
        AppRoutes.loginRouteName: (context) => const LoginScreen(),
        AppRoutes.registerRouteName: (context) => const RegisterScreen(),
        AppRoutes.forgetPasswordRouteName: (context) => const ForgetPasswordScreen(),
      },
    );
  }
}