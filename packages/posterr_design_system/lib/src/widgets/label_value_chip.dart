import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../theme/theme.dart';

class LabelValueChip extends Chip {
  final String labelText;

  final String value;

  LabelValueChip({
    super.key,
    required this.labelText,
    required this.value,
  }) : super(
          label: Text('$labelText: $value'),
          labelStyle: TextStyles.smallBold(),
          labelPadding: const EdgeInsets.symmetric(horizontal: Spacing.x1),
          backgroundColor: Colors.transparent,
          shape: StadiumBorder(
            side: BorderSide(
              width: 1,
              color: AppColors.brownishGrey,
            ),
          ),
        );
}
