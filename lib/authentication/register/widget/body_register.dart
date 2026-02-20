import 'package:flutter/material.dart';
import 'package:movies_app_project/utils/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String image;
  final TextInputType keyboardType;
  final bool obscureText;
  final VoidCallback? toggleObscure;
  final bool showSuffixIcon;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.image,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.toggleObscure,
    this.showSuffixIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      obscureText: obscureText,
      style: TextStyle(color: AppColors.whiteColor),
      decoration: InputDecoration(
        fillColor: AppColors.greyColor,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(10),
          child: Image.asset(
            image,
            width: 20,
            height: 20,
          ),
        ),
        hintText: hintText,
        hintStyle: TextStyle(color: AppColors.whiteColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        suffixIcon: showSuffixIcon
            ? IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.whiteColor,
                ),
                onPressed: toggleObscure,
              )
            : null,
      ),
    );
  }
}
