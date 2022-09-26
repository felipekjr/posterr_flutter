import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:posterr_design_system/posterr_design_system.dart';

import '../../core/extensions/extensions.dart';
import '../../core/services/user_session_service.dart';
import '../../domain/entities/entities.dart';
import '../../domain/helpers/helpers.dart';

class Feed extends StatelessWidget {
  final List<PostEntity> posts;
  final bool showActions;
  final bool externalScroll;
  final Function(String id)? onQuoteTap;
  final Function(String id)? onRepostTap;

  Feed({
    super.key,
    required this.posts,
    this.onQuoteTap,
    this.onRepostTap,
    this.showActions = true,
    this.externalScroll = false,
  });

  final userSession = GetIt.I.get<UserSessionService>();
  final repostAndQuotedTypes = [PostType.repost, PostType.quote];

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
        final child = post.child;
        if (repostAndQuotedTypes.contains(post.type) && child != null) {
          return RepostCard(
            date: post.createdAt.humanized(), 
            author: post.author.username, 
            quote: post.type == PostType.quote ? post.text : null,
            childPostInfos: SimplePostCardViewModel(
              postId: post.childId!,
              author: child.author.username,
              date: child.createdAt.humanized(),
              text: child.text ?? '',
              showFooter: false
            )
          );
        }
        return SimplePostCard(
          viewModel: SimplePostCardViewModel(
            postId: post.id ?? '',
            author: post.author.username,
            date: post.createdAt.humanized(),
            text: post.text ?? '',
            showFooter: showActions && userSession.activeUser?.id != post.author.id,
          ),
          onQuoteTap: onQuoteTap ?? (String v) {},
          onRepostTap: onRepostTap ?? (String v) {},
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: Spacing.x1,
      ),
    );
  }
}
