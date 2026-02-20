import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app_project/home/widgets/custom_elevated_button.dart';
import 'package:movies_app_project/home/widgets/custom_text_field.dart';
import 'package:movies_app_project/utils/app_assets.dart';
import 'package:movies_app_project/utils/app_colors.dart';
import 'package:movies_app_project/utils/app_routes.dart';
import 'package:movies_app_project/utils/app_styles.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(
          horizontal: width * 0.03
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Image.asset(AppAssets.loginImage),
              ),
          
              SizedBox(height: height * 0.065,),
          
             CustomTextField(
                 hintText: "Email",
                 hintStyle: AppStyles.regular16whiteRoboto,
                 icon: Icon(Icons.email , color: AppColors.whiteColor,),
                 color: AppColors.whiteColor,
             ),
          
              SizedBox(height: height * 0.02,),

              CustomTextField(
                  hintText: "Password",
                  hintStyle: AppStyles.regular16whiteRoboto,
                  icon: Icon(Icons.lock , color: AppColors.whiteColor,),
                  color: AppColors.whiteColor,
                suffixIcon: Icon(Icons.visibility_off , color: AppColors.whiteColor,),
                textAlignVertical: TextAlignVertical.center,
              ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: height * 0.02
                    ),
                    child: InkWell(
                      onTap : (){
                        //TODO : navigate to reset password screen
                      },
                      child: Text("Forget Password?" ,
                        style: AppStyles.semiBold14Yellow,
                      ),
                    ),
                  ),
                ],
              ),
          
              CustomElevatedButton(
                text: "Login" , style: AppStyles.regular20black,onPressed: (){
                  // TODO : Navigate to home screen
                Navigator.pushNamed(context, AppRoutes.homeScreenRouteName);
              },
              ),
          
              SizedBox(height: height * 0.02,),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 8,
                children: [
                  Text("Don’t Have Account ?" , style: AppStyles.regular14whiteRoboto,),
                  InkWell(
                      onTap : (){
                        //TODO : Navigate to register screen
                        Navigator.pushNamed(context, AppRoutes.registerRouteName);
                      },
                      child: Text("Create One" , style: AppStyles.semiBold14Yellow,))
                ],
              ),

              SizedBox(height: height * 0.02,),

              Row(
                spacing: 2,
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
                  Text("OR" , style: AppStyles.semiBold14Yellow,),
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

              SizedBox(height: height * 0.02,),

              SizedBox(
                width: width * 1,
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
                    child: Row(
                      spacing: width * 0.03,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AppAssets.googleIcon),
                        Text("Login With Google" , style: AppStyles.regular20black,)
                      ],
                    )
                ),
              ),

              SizedBox(height: height * 0.04,),

              Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: AppColors.blackColor,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: AppColors.yellowColor,
                    width: 3
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap : (){
                        //TODO : when click change the language and make the border yellow
                      },
                      child: CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage('assets/images/usa_logo.png'),
                      ),
                    ),
                    SizedBox(width: width * 0.05,),
                    InkWell(
                      onTap : (){
                        //TODO : when click change the language and make the border yellow
                      },
                      child: CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage('assets/images/egy_logo.png'),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
