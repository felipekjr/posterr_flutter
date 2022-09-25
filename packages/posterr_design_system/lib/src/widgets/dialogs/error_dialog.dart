import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class ErrorDialog extends StatelessWidget {
  final String message;

  const ErrorDialog({ 
    Key? key,
    required this.message
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0)
      ),
      child: Container(
        constraints: const BoxConstraints(maxHeight: 170, minHeight: 170),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            Spacing.x2,
            Spacing.x3,
            Spacing.x2,
            Spacing.x1,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Error', style: TextStyles.medium()),
              Text(message, style: TextStyles.normalThin(), textAlign: TextAlign.center),
              const Divider(),
              TextButton(
                onPressed: () => Navigator.pop(context), 
                child: Text(
                  'Ok', 
                  style: TextStyles.normalBold(color: AppColors.black),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}