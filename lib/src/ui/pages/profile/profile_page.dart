import 'package:flutter/material.dart';
import 'package:posterr_design_system/posterr_design_system.dart';
import 'package:posterr_flutter/src/core/extensions/extensions.dart';
import 'package:posterr_flutter/src/domain/entities/user_entity.dart';
import 'package:posterr_flutter/src/ui/pages/base_page.dart';
import 'package:posterr_flutter/src/ui/widgets/widgets.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/helpers/helpers.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    super.key,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final user = UserEntity(
      username: 'Felipe Rodrigues',
      createdAt: DateTime.now().subtract(Duration(days: 60)));

  final userPosts = [
    PostEntity(
      createdAt: DateTime.now().subtract(Duration(minutes: 2)),
      author: 'Felipe Rodrigues',
      type: PostType.normal,
      text: "sasasasasasasasasasa sasassasa asasasasa ssaasasas assaas",
    ),
    PostEntity(
      createdAt: DateTime.now().subtract(Duration(minutes: 2)),
      author: 'Felipe Rodrigues',
      type: PostType.normal,
      text: "sasasasasasasasasasa sasassasa asasasasa ssaasasas assaas",
    ),
    PostEntity(
      createdAt: DateTime.now().subtract(Duration(minutes: 2)),
      author: 'Felipe Rodrigues',
      type: PostType.normal,
      text: "sasasasasasasasasasa sasassasa asasasasa ssaasasas assaas",
    ),
    PostEntity(
      createdAt: DateTime.now().subtract(Duration(minutes: 2)),
      author: 'Felipe Rodrigues',
      type: PostType.normal,
      text: "sasasasasasasasasasa sasassasa asasasasa ssaasasas assaas",
    ),
    PostEntity(
      createdAt: DateTime.now().subtract(Duration(minutes: 2)),
      author: 'Felipe Rodrigues',
      type: PostType.normal,
      text: "sasasasasasasasasasa sasassasa asasasasa ssaasasas assaas",
    )
  ];

  final postsTypeCount = {
    PostType.normal: 2,
    PostType.quote: 3,
    PostType.repost: 4
  };
  @override
  Widget build(BuildContext context) {
    return BasePage(
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
        )),
        title: 'User profile');
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
        Feed(
          posts: userPosts,
          externalScroll: true,
          showActions: false,
        )
      ],
    );
  }

  Center _userInfos() {
    return Center(
      child: Column(
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
          Wrap(
            spacing: Spacing.x1,
            children: postsTypeCount.entries
                .map(
                  (e) => LabelValueChip(
                    labelText: e.key.label,
                    value: e.value.toString(),
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
