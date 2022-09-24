import 'package:flutter/material.dart';
import 'package:posterr_design_system/posterr_design_system.dart';
import 'package:posterr_flutter/src/core/extensions/extensions.dart';
import 'package:posterr_flutter/src/core/navigation/navigation_service.dart';
import 'package:posterr_flutter/src/core/routes/route.dart';
import 'package:posterr_flutter/src/domain/entities/entities.dart';
import 'package:posterr_flutter/src/domain/helpers/helpers.dart';
import 'package:posterr_flutter/src/ui/pages/base_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final post = PostEntity(
    createdAt: DateTime.now().subtract(Duration(minutes: 2)),
    author: 'Felipe Rodrigues',
    type: PostType.normal,
    text: "sasasasasasasasasasa sasassasa asasasasa ssaasasas assaas",
  );
  @override
  Widget build(BuildContext context) {
    return BasePage(
      customAppBar: CustomAppBar(
        title: 'Posterr',
        hideLeading: true,
        action: Padding(
          padding: const EdgeInsets.only(right: Spacing.x1),
          child: IconButton(
            icon: const Icon(Icons.person, size: 24),
            tooltip: 'Profile',
            onPressed: () =>
                NavigationService.instance.navigateTo(NamedRoute.profile),
          ),
        ),
      ),
      child: _posts(),
    );
  }

  ListView _posts() {
    return ListView.separated(
      itemCount: 50,
      itemBuilder: (context, index) {
        return SimplePostCard(
          author: post.author,
          date: post.createdAt.humanized(),
          text: post.text ?? '',
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: Spacing.x1,
      ),
    );
  }
}
