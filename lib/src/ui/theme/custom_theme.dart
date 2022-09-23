import 'package:flutter/material.dart';

import 'app_colors.dart';

class CustomTheme {
  static ThemeData data = ThemeData(
    primaryColor: AppColors.black,
    scaffoldBackgroundColor: AppColors.white,
    iconTheme: IconThemeData(
      color: AppColors.black,
      size: 18
    ),
  );
}
