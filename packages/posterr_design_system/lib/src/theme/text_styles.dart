import 'package:flutter/widgets.dart';
import 'app_colors.dart';

class TextStyles {
  static TextStyle normal({Color? color}) => TextStyle(
    fontSize: 14.0,
    color: color ?? AppColors.black,
    fontWeight: FontWeight.normal,
  );

  static TextStyle normalBold({Color? color}) => TextStyle(
    fontSize: 14.0,
    color: color ?? AppColors.black,
    fontWeight: FontWeight.bold,
  );

  static TextStyle normalThin({Color? color}) => TextStyle(
    fontSize: 14.0,
    color: color ?? AppColors.black,
    fontWeight: FontWeight.w300,
  );

  static TextStyle medium({Color? color}) => TextStyle(
    fontSize: 16.0,
    color: color ?? AppColors.black,
    fontWeight: FontWeight.bold,
  );
  
  static TextStyle small({Color? color}) => TextStyle(
    fontSize: 10.0,
    color: color ?? AppColors.black,
    fontWeight: FontWeight.w500,
  );

  static TextStyle smallThin({Color? color}) => TextStyle(
    fontSize: 10.0,
    color: color ?? AppColors.black,
    fontWeight: FontWeight.w300,
  );

  static TextStyle smallBold({Color? color}) => TextStyle(
    fontSize: 10.0,
    color: color ?? AppColors.black,
    fontWeight: FontWeight.bold,
  );

  static TextStyle buttonText({Color? color}) => TextStyle(
    fontSize: 16.0,
    color: color ?? AppColors.black,
    fontWeight: FontWeight.bold,
  );
}