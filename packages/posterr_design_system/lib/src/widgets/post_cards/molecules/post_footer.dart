import 'package:flutter/material.dart';

import '../../../theme/theme.dart';
import '../../buttons/custon_icon_button.dart';

class PostFooter extends StatelessWidget {
  final String postId;
  final Function(String id) onQuoteTap;
  final Function(String id) onRepostTap;

  const PostFooter({
    Key? key,
    required this.postId,
    required this.onQuoteTap,
    required this.onRepostTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomIconButton(
          onTap: () => onQuoteTap(postId),
          icon: Icons.mode_comment_outlined,
        ),
        const SizedBox(
          width: Spacing.x2,
        ),
        CustomIconButton(
          onTap: () => onRepostTap(postId),
          icon: Icons.share_outlined,
        ),
      ],
    );
  }
}