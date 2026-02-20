import 'package:flutter/material.dart';
import 'package:movies_app_project/utils/app_colors.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.yellowColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Forget Password',
          style: TextStyle(color: AppColors.yellowColor),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 25,
          children: [
            Image.asset("assets/images/forgot-password.png"),
            TextFormField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Email",
                hintStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Color(0xFF282A28),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    "assets/images/email.png",
                    width: 24,
                    height: 24,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.yellowColor,
                      padding: EdgeInsets.symmetric(
                          vertical: height * 0.0175
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13),
                      )
                  ),
                  onPressed: (){},
                  child: Text("Verify Email",style: TextStyle(
                    color: AppColors.blackColor
                  ),)
              ),
            )
          ],
        ),
      )
    );
  }
}