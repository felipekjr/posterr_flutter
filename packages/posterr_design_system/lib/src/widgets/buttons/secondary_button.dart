import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class SecondaryButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool disabled;
  final Color? color;

  const SecondaryButton(
      {Key? key,
      required this.title,
      required this.onTap,
      this.disabled = false,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: BorderSide(width: 1, color: AppColors.black),
      ),
      onPressed: disabled ? null : onTap,
      child: Container(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(Spacing.x2),
          child: Text(
            title,
            style: TextStyles.normal(),
          ),
        ),
      ),
    );
  }
}
