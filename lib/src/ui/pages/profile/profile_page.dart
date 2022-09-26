import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:posterr_design_system/posterr_design_system.dart';

import '../../../core/extensions/extensions.dart';
import '../../../domain/entities/entities.dart';
import '../../../domain/helpers/helpers.dart';
import '../../../ui/pages/base_page.dart';
import '../../../ui/pages/pages.dart';
import '../../../ui/widgets/widgets.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    super.key,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ProfilePresenter presenter = GetIt.I.get<ProfilePresenter>();

  @override
  void initState() {
    presenter.onInit();
    presenter.getPosts();
    super.initState();
  }

  @override
  void dispose() {
    presenter.onDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      stateNotifier: presenter.state,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: Spacing.x2,
            ),
            _userInfos(),
            const SizedBox(
              height: Spacing.x3,
            ),
            _userFeed()
          ],
        ),
      ),
      title: 'User profile', 
      onSaveCreatePostModal: (String v) { 
        presenter.makeSimplePost(text: v);
      },
    );
  }

  Widget _userFeed() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: Spacing.x2),
          child: Text(
            'Your posts',
            style: TextStyles.normalBold(),
          ),
        ),
        const SizedBox(
          height: Spacing.x1,
        ),
        ValueListenableBuilder<List<PostEntity>>(
          valueListenable: presenter.postsNotifier,
          builder: (context, userPosts, _) {
            return Feed(
              posts: userPosts,
              externalScroll: true,
              showActions: false,
            );
          },
        )
      ],
    );
  }

  Center _userInfos() {
    return Center(
      child: ValueListenableBuilder<UserEntity?>(
        valueListenable: presenter.loggedUserNotifier,
        builder: (context, user, _) {
          return user != null
              ? Column(
                  children: [
                    Text(user.username, style: TextStyles.largeBold()),
                    const SizedBox(
                      height: Spacing.x1,
                    ),
                    Text(
                      'Joined ${user.createdAt.humanized()}',
                      style: TextStyles.normal(),
                    ),
                    const SizedBox(
                      height: Spacing.x1,
                    ),
                    ValueListenableBuilder<Map<PostType, int>>(
                      valueListenable: presenter.userPostsCount,
                      builder: (context, postsPerType, _) {
                        return Wrap(
                          spacing: Spacing.x1,
                          children: postsPerType.entries
                              .map(
                                (e) => LabelValueChip(
                                  labelText: e.key.label,
                                  value: e.value.toString(),
                                ),
                              )
                              .toList(),
                        );
                      }
                    )
                  ],
                )
              : const SizedBox();
        },
      ),
    );
  }
}
