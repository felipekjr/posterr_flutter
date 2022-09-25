import 'package:flutter/material.dart';
import 'package:posterr_design_system/src/widgets/post_cards/molecules/post_header.dart';
import 'package:posterr_design_system/src/widgets/widgets.dart';

import '../../theme/theme.dart';

class RepostCard extends StatelessWidget {
  final String date;
  final String author;
  final SimplePostCardViewModel childPostInfos;

const RepostCard({
    Key? key,
    required this.date,
    required this.author,
    required this.childPostInfos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Spacing.x2),
      child: Column(
        children: [
          PostHeader(author: author, date: date,),
          const SizedBox(height: Spacing.x2,),
          SimplePostCard(
            onQuoteTap: (String v) {},
            onRepostTap: (String v) {}, 
            viewModel: childPostInfos,
            isChild: true,
          )
        ],
      ),
    );
  }
}
