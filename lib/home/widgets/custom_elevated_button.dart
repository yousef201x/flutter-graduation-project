import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  String? text;
  TextStyle? style;
  void Function()? onPressed;
  Image? image;
   CustomElevatedButton({super.key , required this.text ,
     required this.style , required this.onPressed , this.image
   });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width * 1,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.yellowColor,
              padding: EdgeInsets.symmetric(
                  vertical: height * 0.0175
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              )
          ),
          onPressed: onPressed,
          child: Text(text! , style: style,)
      ),
    );
  }
}
