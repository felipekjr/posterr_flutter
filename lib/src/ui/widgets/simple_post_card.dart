import 'package:flutter/material.dart';
import 'package:posterr_flutter/src/ui/widgets/widgets.dart';

import '../../core/extensions/extensions.dart';
import '../theme/theme.dart';

class SimplePostCard extends StatelessWidget {
  final DateTime date;
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
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
),        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _header(),
            const SizedBox(height: Spacing.x1),
            Text(text),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomIconButton(
                  onTap: () {},
                  icon: Icons.mode_comment_outlined,
                ),
                CustomIconButton(
                  onTap: () {},
                  icon: Icons.share_outlined,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Row _header() {
    return Row(
      children: [
        Text(
          author,
          style: TextStyles.normalBold(),
        ),
        Text(date.humanized())
      ],
    );
  }
}
