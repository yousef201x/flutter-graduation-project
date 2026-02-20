import 'package:flutter/material.dart';
import 'package:movies_app_project/utils/app_colors.dart';
import 'package:movies_app_project/utils/app_styles.dart';


class MyBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  MyBar({super.key,required this.title,});

  @override
  Widget build(BuildContext context) {
    return  AppBar(
      backgroundColor: AppColors.blackColor,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: AppColors.yellowColor,
        ),
        onPressed: () {},
      ),
      title: Text(
        title,
        style: AppStyles.bold20Yellow,
            
        ),
      );
 
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}