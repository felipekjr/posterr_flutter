import 'package:flutter/material.dart';
import 'package:posterr_design_system/posterr_design_system.dart';

class CustomFloatActionButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;

  const CustomFloatActionButton(
      {super.key, required this.onTap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onTap,
      child: Icon(icon, size: 30,),
      backgroundColor: AppColors.black,
    );
  }
}
