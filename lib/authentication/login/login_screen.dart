import 'package:flutter/material.dart';
import 'package:movies_app_project/authentication/services/AuthService.dart';
import 'package:movies_app_project/home/widgets/custom_elevated_button.dart';
import 'package:movies_app_project/utils/app_assets.dart';
import 'package:movies_app_project/utils/app_colors.dart';
import 'package:movies_app_project/utils/app_routes.dart';
import 'package:movies_app_project/utils/app_styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService _authService = AuthService();
  bool isLoading = false;
  bool isObscured = true;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator(color: AppColors.yellowColor))
          : Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Image.asset(AppAssets.loginImage),
              ),
              SizedBox(height: height * 0.065),

              // Email Field
              TextFormField(
                controller: emailController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Email",
                  hintStyle: AppStyles.regular16whiteRoboto,
                  prefixIcon: const Icon(Icons.email, color: Colors.white),
                  filled: true,
                  fillColor: Colors.grey[900],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),

              SizedBox(height: height * 0.02),

              // Password Field
              TextFormField(
                controller: passwordController,
                obscureText: isObscured,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: AppStyles.regular16whiteRoboto,
                  prefixIcon: const Icon(Icons.lock, color: Colors.white),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isObscured = !isObscured;
                      });
                    },
                    icon: Icon(
                      isObscured ? Icons.visibility_off : Icons.visibility,
                      color: Colors.white,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.grey[900],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: height * 0.02),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.forgetPasswordRouteName);
                      },
                      child: Text(
                        "Forget Password?",
                        style: AppStyles.semiBold14Yellow,
                      ),
                    ),
                  ),
                ],
              ),

              CustomElevatedButton(
                text: "Login",
                style: AppStyles.regular20black,
                onPressed: _login,
              ),

              SizedBox(height: height * 0.02),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don’t Have Account ?", style: AppStyles.regular14whiteRoboto),
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.registerRouteName);
                    },
                    child: Text("Create One", style: AppStyles.semiBold14Yellow),
                  )
                ],
              ),

              SizedBox(height: height * 0.02),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Divider(
                      color: AppColors.yellowColor,
                      thickness: 0.8,
                      indent: width * 0.09,
                      endIndent: width * 0.06,
                    ),
                  ),
                  Text("OR", style: AppStyles.semiBold14Yellow),
                  Expanded(
                    child: Divider(
                      color: AppColors.yellowColor,
                      thickness: 0.8,
                      indent: width * 0.06,
                      endIndent: width * 0.09,
                    ),
                  )
                ],
              ),

              SizedBox(height: height * 0.02),

              SizedBox(
                width: width * 1,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.yellowColor,
                    padding: EdgeInsets.symmetric(vertical: height * 0.0175),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppAssets.googleIcon),
                      SizedBox(width: width * 0.03),
                      Text("Login With Google", style: AppStyles.regular20black)
                    ],
                  ),
                ),
              ),

              SizedBox(height: height * 0.04),
            ],
          ),
        ),
      ),
    );
  }

  void _login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _showSnack("Please fill all fields");
      return;
    }

    setState(() {
      isLoading = true;
    });

    final result = await _authService.loginWithEmail(
      email: email,
      password: password,
    );

    setState(() {
      isLoading = false;
    });

    if (result == "success") {
      Navigator.pushReplacementNamed(context, AppRoutes.homeScreenRouteName);
    } else {
      _showSnack(result ?? "Login failed");
    }
  }

  void _showSnack(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}