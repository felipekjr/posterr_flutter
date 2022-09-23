import 'package:flutter/material.dart';
import 'package:posterr_flutter/src/core/navigation/navigation_service.dart';
import 'package:posterr_flutter/src/core/routes/route.dart';
import 'package:posterr_flutter/src/domain/entities/entities.dart';
import 'package:posterr_flutter/src/domain/helpers/helpers.dart';
import 'package:posterr_flutter/src/ui/widgets/simple_post_card.dart';

import '../../theme/theme.dart';
import '../../widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final post = PostEntity(
    createdAt: DateTime.now().subtract(Duration(minutes: 2)),
    author: 'Felipe',
    type: PostType.normal,
    text: "sasasasasasasasasasa sasassasa asasasasa ssaasasas assaas",
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Feed',
        hideLeading: true,
        action: Padding(
          padding: const EdgeInsets.only(right: Spacing.x1),
          child: IconButton(
            icon: const Icon(Icons.person, size: 30),
            tooltip: 'Profile',
            onPressed: () =>
                NavigationService.instance.navigateTo(NamedRoute.profile),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            Spacing.x1,
            Spacing.x1,
            Spacing.x1,
            0,
          ),
          child: ListView.separated(
            itemCount: 4,
            itemBuilder: (context, index) {
              return SimplePostCard(
                author: post.author,
                date: post.createdAt,
                text: post.text ?? '',
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              height: Spacing.x2,
            ),
          ),
        ),
      ),
    );
  }
}
