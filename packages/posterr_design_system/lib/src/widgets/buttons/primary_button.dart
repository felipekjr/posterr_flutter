import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../theme/theme.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool disabled;
  final bool loading;
  final Widget? icon;

  const PrimaryButton({
    Key? key,
    required this.title,
    required this.onTap,
    this.disabled = false,
    this.loading = false,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: disabled ? .4 : 1,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.black,
        textStyle: TextStyles.normal(color: AppColors.red)
      ),
        onPressed: disabled || loading ? null : onTap,
        child: Container(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(Spacing.x2),
            child: !loading
                ? _content()
                : SpinKitThreeBounce(
                    size: 16,
                    color: AppColors.white,
                  ),
          ),
        ),
      ),
    );
  }

  Row _content() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icon != null) ...[
          icon!,
          const SizedBox(
            width: 10,
          )
        ],
        Text(
          title,
          style: TextStyles.mediumLight(color: AppColors.white),
        ),
      ],
    );
  }
}
