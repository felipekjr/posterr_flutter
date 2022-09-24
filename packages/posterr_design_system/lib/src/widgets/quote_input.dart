
import 'package:flutter/material.dart';

import '../theme/theme.dart';

class QuoteInput extends StatefulWidget {
  final String hint;
  final Function(String) onChanged;

  const QuoteInput({
    Key? key, 
    required this.hint, 
    required this.onChanged,
  }) : super(key: key);

  @override
  State<QuoteInput> createState() => _QuoteInputState();
}

class _QuoteInputState extends State<QuoteInput> {
  int maxLength = 777;
  late int counter = maxLength;
  late final TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    controller.addListener(() {
      setState(() {
        counter =  maxLength - controller.text.length;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      controller: controller,
      style: TextStyles.normalThin(),
      maxLength: maxLength,
      minLines: 8,
      maxLines: 8,
      decoration:InputDecoration(
        counterText: '$counter',
        fillColor: AppColors.background,
        filled: true,
        contentPadding: const EdgeInsets.all(Spacing.x2Half),
        hintText: widget.hint,
        hintStyle: TextStyles.normalThin(),
        // errorText: error ? errorText : null,
        // errorStyle: TextStyles.smallThin(color: AppColors.red),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.grey,
            width: 1
          )
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.grey,
            width: 2
          )
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.red,
            width: 2
          )
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.red,
            width: 2
          )
        ),
      ),
      onChanged: widget.onChanged,
    );
  }
}