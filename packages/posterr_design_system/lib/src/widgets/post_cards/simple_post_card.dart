import 'package:flutter/material.dart';

import './view_models/simple_post_card_view_model.dart';
import '../../theme/theme.dart';
import 'molecules/post_footer.dart';
import 'molecules/post_header.dart';

class SimplePostCard extends StatelessWidget {
  final SimplePostCardViewModel viewModel;
  final Function(String id) onQuoteTap;
  final Function(String id) onRepostTap;
  final bool isChild;

  const SimplePostCard({
    Key? key,
    required this.viewModel,
    required this.onQuoteTap,
    required this.onRepostTap,
    this.isChild = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Spacing.x2),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
        border: isChild ? Border.all(color: AppColors.grey, width: 1) : null
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PostHeader(author: viewModel.author, date: viewModel.date, smallVersion: isChild,),
          const SizedBox(height: Spacing.x1),
          Text(
            viewModel.text,
            style: TextStyles.normal(color: Colors.black),
          ),
          const SizedBox(height: Spacing.x1),
          Visibility(
            visible: viewModel.showFooter,
            child: PostFooter(
              postId: viewModel.postId,
              onQuoteTap: onQuoteTap,
              onRepostTap: onRepostTap,
            ),
          )
        ],
      ),
    );
  }
}
