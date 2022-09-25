import 'package:flutter/material.dart';

import '../widgets/dialogs/error_dialog.dart';

showErrorDialog(BuildContext context, {String? message}) {
  showDialog(
    context: context,
    builder: (context) => ErrorDialog(
      message: message ?? 'Unexpected error',
    ),
  );
}
