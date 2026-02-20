
import 'package:flutter/material.dart';
import 'package:movies_app_project/utils/app_colors.dart';

class LanguageToggle extends StatefulWidget {
  const LanguageToggle({super.key});

  @override
  State<LanguageToggle> createState() => _LanguageToggleState();
}

class _LanguageToggleState extends State<LanguageToggle> {
  bool isEnglish = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 50,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.yellowColor, width: 2),
        borderRadius: BorderRadius.circular(35),
      ),
      child: Stack(
        children: [
          /// Animated Circle
          AnimatedAlign(
            duration: const Duration(milliseconds: 250),
            alignment:
                isEnglish ? Alignment.centerLeft : Alignment.centerRight,
            child: Container(
              width: 30,
              height: 30,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
            ),
          ),

          /// Flags Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isEnglish = true;
                  });
                },
                child: const CircleAvatar(
                  radius: 16,
                  backgroundImage: AssetImage('assets/images/LR.png'),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isEnglish = false;
                  });
                },
                child: const CircleAvatar(
                  radius: 16,
                  backgroundImage: AssetImage('assets/images/EG.png'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}