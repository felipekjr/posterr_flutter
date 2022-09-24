import 'package:flutter/material.dart';

import '../theme/theme.dart';
import 'custon_icon_button.dart';

class SimplePostCard extends StatelessWidget {
  final String date;
  final String text;
  final String author;
  const SimplePostCard({
    Key? key,
    required this.date,
    required this.text,
    required this.author,
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
            _header(),
            const SizedBox(height: Spacing.x1),
            Text(
              text,
              style: TextStyles.normal(color: Colors.black),
            ),
            const SizedBox(height: Spacing.x1),
            _footer()
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

  Row _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 25,
              height: 25,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: AppColors.grey),
            ),
            const SizedBox(
              width: Spacing.x1,
            ),
            Text(
              author,
              style: TextStyles.normalBold(),
            ),
          ],
        ),
        Text(
          date,
          style: TextStyles.smallThin(),
        )
      ],
    );
  }
}
