import 'package:flutter/material.dart';
import 'package:posterr_design_system/posterr_design_system.dart';

import '../../core/extensions/extensions.dart';
import '../../domain/entities/entities.dart';

class Feed extends StatelessWidget {
  final List<PostEntity> posts;
  final bool showActions;
  final bool externalScroll;

  const Feed({
    super.key,
    required this.posts,
    this.showActions = true,
    this.externalScroll = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: externalScroll
          ? const NeverScrollableScrollPhysics()
          : const ScrollPhysics(),
      shrinkWrap: externalScroll,
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        return SimplePostCard(
          author: post.author,
          date: post.createdAt.humanized(),
          text: post.text ?? '',
          showFooter: showActions,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: Spacing.x2,
      ),
    );
  }
}
