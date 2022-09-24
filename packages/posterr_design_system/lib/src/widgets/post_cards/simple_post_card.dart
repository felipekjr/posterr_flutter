import 'package:flutter/material.dart';

import '../../theme/theme.dart';
import '../buttons/custon_icon_button.dart';
import 'post_header.dart';

class SimplePostCard extends StatelessWidget {
  final String date;
  final String text;
  final String author;
  final bool showFooter;
  const SimplePostCard({
    Key? key,
    required this.date,
    required this.text,
    required this.author,
    this.showFooter = true
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(Spacing.x2),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PostHeader(author: author, date: date),
            const SizedBox(height: Spacing.x1),
            Text(
              text,
              style: TextStyles.normal(color: Colors.black),
            ),
            const SizedBox(height: Spacing.x1),
            Visibility(
              visible: showFooter,
              child: _footer()
            )
          ],
        ),
      ),
    );
  }

  Row _footer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomIconButton(
          onTap: () {},
          icon: Icons.mode_comment_outlined,
        ),
        const SizedBox(
          width: Spacing.x2,
        ),
        CustomIconButton(
          onTap: () {},
          icon: Icons.share_outlined,
        ),
      ],
    );
  }
}


