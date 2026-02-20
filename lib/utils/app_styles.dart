import 'dart:ui';

import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppStyles {
  static final TextStyle bold24white = GoogleFonts.inter(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor
  );

  static final TextStyle regular20white = GoogleFonts.inter(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: AppColors.whiteColor
  );

  static final TextStyle regular20black = GoogleFonts.inter(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: AppColors.blackColor
  );

  static final TextStyle regular16black = GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColors.blackColor
  );

  static final TextStyle regular16white = GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColors.whiteColor
  );

  static final TextStyle regular14white = GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.whiteColor
  );

  static final TextStyle regular14whiteRoboto = GoogleFonts.roboto(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.whiteColor
  );

  static final TextStyle bold16yellowRoboto = GoogleFonts.roboto(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: AppColors.yellowColor
  );

  static final TextStyle bold20whiteRoboto = GoogleFonts.roboto(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: AppColors.whiteColor
  );

  static final TextStyle bold24whiteRoboto = GoogleFonts.roboto(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: AppColors.whiteColor
  );

  static final TextStyle bold36whiteRoboto = GoogleFonts.roboto(
      fontSize: 36,
      fontWeight: FontWeight.bold,
      color: AppColors.whiteColor
  );

  static final TextStyle regular20whiteRoboto = GoogleFonts.roboto(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: AppColors.whiteColor
  );

  static final TextStyle regular16whiteRoboto = GoogleFonts.roboto(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColors.whiteColor
  );

  static final TextStyle semiBold20Black = GoogleFonts.inter(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppColors.blackColor
  );

  static final TextStyle semiBold20Yellow = GoogleFonts.inter(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppColors.yellowColor
  );

  static final TextStyle semiBold14Yellow = GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: AppColors.yellowColor
  );

  static final TextStyle bold20Yellow = GoogleFonts.inter(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: AppColors.yellowColor
  );

  static final TextStyle bold20Black = GoogleFonts.inter(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: AppColors.blackColor
  );
}