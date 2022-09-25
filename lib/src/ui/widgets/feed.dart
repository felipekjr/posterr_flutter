import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:posterr_design_system/posterr_design_system.dart';
import 'package:posterr_flutter/src/core/services/user_session_service.dart';

import '../../core/extensions/extensions.dart';
import '../../domain/entities/entities.dart';

class Feed extends StatelessWidget {
  final List<PostEntity> posts;
  final bool showActions;
  final bool externalScroll;

  Feed({
    super.key,
    required this.posts,
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
        return SimplePostCard(
          author: post.author.username,
          date: post.createdAt.humanized(),
          text: post.text ?? '',
          showFooter: showActions && userSession.activeUsername != post.author
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: Spacing.x2,
      ),
    );
  }
}
