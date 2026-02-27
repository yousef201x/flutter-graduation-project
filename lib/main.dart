import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:movies_app_project/authentication/login/forget_password_screen.dart';
import 'package:movies_app_project/authentication/login/login_screen.dart';
import 'package:movies_app_project/authentication/register/register_screen.dart';
import 'package:movies_app_project/home/home_screen.dart';
import 'package:movies_app_project/onboarding_screen/onboarding_screen.dart';
import 'package:movies_app_project/profile/update_profile_screen.dart';
import 'package:movies_app_project/utils/app_routes.dart';
import 'package:movies_app_project/services/AuthService.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: dotenv.env['FIREBASE_API_KEY']!,
      appId: dotenv.env['FIREBASE_APP_ID']!,
      messagingSenderId: dotenv.env['FIREBASE_MESSAGING_SENDER_ID']!,
      projectId: dotenv.env['FIREBASE_PROJECT_ID']!,
      storageBucket: dotenv.env['FIREBASE_STORAGE_BUCKET'],
    ),
  );

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
        AppRoutes.profileRouteName:(context) => const UpdateProfileScreen()
      },
    );
  }
}