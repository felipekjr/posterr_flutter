import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:posterr_design_system/posterr_design_system.dart';
import 'package:posterr_flutter/src/core/services/user_session_service.dart';
import 'package:posterr_flutter/src/domain/helpers/helpers.dart';

import '../../core/extensions/extensions.dart';
import '../../domain/entities/entities.dart';

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
        if (post.type == PostType.repost) {
          return RepostCard(
            date: post.createdAt.humanized(), 
            author: post.author.username, 
            childPostInfos: SimplePostCardViewModel(
              postId: post.id!,
              author: post.author.username,
              date: post.createdAt.humanized(),
              text: post.text ?? '',
              showFooter: showActions && userSession.activeUser?.id != post.author.id,
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
        height: Spacing.x2,
      ),
    );
  }
}
