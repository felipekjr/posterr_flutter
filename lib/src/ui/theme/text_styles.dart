import 'package:flutter/widgets.dart';
import 'app_colors.dart';

class TextStyles {
  static TextStyle normal({Color? color}) => TextStyle(
    fontSize: 16.0,
    color: color ?? AppColors.black,
    fontWeight: FontWeight.normal,
  );

  static TextStyle normalBold({Color? color}) => TextStyle(
    fontSize: 16.0,
    color: color ?? AppColors.black,
    fontWeight: FontWeight.bold,
  );

  static TextStyle medium({Color? color}) => TextStyle(
    fontSize: 18.0,
    color: color ?? AppColors.black,
    fontWeight: FontWeight.bold,
  );
  
  static TextStyle header = TextStyle(
    fontSize: 20.0,
    color: AppColors.black,
    fontWeight: FontWeight.w700,
  );

  static TextStyle normalThin({Color? color}) => TextStyle(
    fontSize: 16.0,
    color: color ?? AppColors.black,
    fontWeight: FontWeight.w300,
  );

  static TextStyle small({Color? color}) => TextStyle(
    fontSize: 12.0,
    color: color ?? AppColors.black,
    fontWeight: FontWeight.w500,
  );

  static TextStyle smallThin({Color? color}) => TextStyle(
    fontSize: 12.0,
    color: color ?? AppColors.black,
    fontWeight: FontWeight.w300,
  );

  static TextStyle smallBold({Color? color}) => TextStyle(
    fontSize: 12.0,
    color: color ?? AppColors.black,
    fontWeight: FontWeight.bold,
  );

  static TextStyle buttonText({Color? color}) => TextStyle(
    fontSize: 16.0,
    color: color ?? AppColors.black,
    fontWeight: FontWeight.bold,
  );
}