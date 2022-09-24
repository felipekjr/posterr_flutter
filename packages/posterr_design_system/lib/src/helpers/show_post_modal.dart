import 'package:flutter/material.dart';

import '../theme/theme.dart';
import '../widgets/widgets.dart';

showPostModal(BuildContext context, {required Function(String) onSave}) {
  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return PostModalBody(
        onSave: onSave,
      );
    },
  );
}

class PostModalBody extends StatefulWidget {
  final Function(String) onSave;
  const PostModalBody({
    Key? key,
    required this.onSave,
  }) : super(key: key);

  @override
  State<PostModalBody> createState() => _PostModalBodyState();
}

class _PostModalBodyState extends State<PostModalBody> {
  String quote = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      color: AppColors.white,
      padding: const EdgeInsets.symmetric(
          vertical: Spacing.x3, horizontal: Spacing.x2),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Create a post',
            style: TextStyles.medium(),
          ),
          const SizedBox(
            height: Spacing.x2,
          ),
          QuoteInput(hint: 'Write a quote', onChanged: (String v) {
            setState(() {
              quote = v;
            });
          },),
          const SizedBox(
            height: Spacing.x2,
          ),
          PrimaryButton(
            title: 'Post',
            onTap: () => widget.onSave(quote),
          ),
        ],
      ),
    );
  }
}
