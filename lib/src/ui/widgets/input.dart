
import 'package:flutter/material.dart';
import '../theme/theme.dart';

class Input extends StatelessWidget {
  final String label;
  final String hint;
  final String errorText;
  final bool error;
  final bool obscure;
  final Function(String) onChanged;
  final String? initialValue;

  const Input({
    Key? key, 
    required this.label, 
    required this.hint, 
    required this.errorText, 
    required this.error, 
    required this.onChanged,
    this.obscure = false,
    this.initialValue
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue ?? '',
      style: TextStyles.normalThin(),
      obscureText: obscure,
      decoration:InputDecoration(
        fillColor: AppColors.background,
        filled: true,
        contentPadding: const EdgeInsets.all(Spacing.x2),
        labelText: label,
        hintText: hint,
        hintStyle: TextStyles.normalThin(),
        labelStyle: TextStyles.normal(),
        errorText: error ? errorText : null,
        errorStyle: TextStyles.smallThin(color: AppColors.red),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            color: AppColors.black,
            width: 1
          )
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            color: AppColors.black,
            width: 2
          )
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            color: AppColors.red,
            width: 2
          )
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            color: AppColors.red,
            width: 2
          )
        ),
      ),
      onChanged: onChanged,
    );
  }
}