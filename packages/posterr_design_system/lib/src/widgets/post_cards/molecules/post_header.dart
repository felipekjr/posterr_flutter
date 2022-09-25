import 'package:flutter/material.dart';

import '../../../theme/theme.dart';

class PostHeader extends StatelessWidget {
  const PostHeader({
    Key? key,
    required this.author,
    required this.date,
    this.smallVersion = false
  }) : super(key: key);

  final String author;
  final String date;
  final bool smallVersion;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: smallVersion ? 20 : 40,
              width: smallVersion ? 20 : 40,
              child: CircleAvatar(
                backgroundColor: AppColors.white,
                backgroundImage:  NetworkImage(
                  'https://api.lorem.space/image/face?w=200&h=200&hash=$author'
                ),
              ),
            ),
            const SizedBox(
              width: Spacing.x1,
            ),
            Text(
              author,
              style: smallVersion ? TextStyles.smallBold() : TextStyles.normalBold(),
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