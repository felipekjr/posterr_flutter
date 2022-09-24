import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class PostHeader extends StatelessWidget {
  const PostHeader({
    Key? key,
    required this.author,
    required this.date,
  }) : super(key: key);

  final String author;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: AppColors.white,
              backgroundImage:  NetworkImage(
                'https://api.lorem.space/image/face?w=200&h=200&hash=$author'
              ),
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