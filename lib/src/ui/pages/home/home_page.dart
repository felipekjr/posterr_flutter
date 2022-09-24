import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:posterr_design_system/posterr_design_system.dart';

import '../../../core/extensions/extensions.dart';
import '../../../core/navigation/navigation_service.dart';
import '../../../core/routes/route.dart';
import '../../../domain/entities/entities.dart';
import '../../../domain/helpers/helpers.dart';
import '../../../ui/pages/base_page.dart';
import '../../../ui/pages/home/home.dart';
import '../../widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final presenter = GetIt.I<HomePresenter>();

  @override
  void initState() {
    presenter.onInit();
    presenter.getAllPosts();
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
      child: ValueListenableBuilder<List<PostEntity>>(
        valueListenable: presenter.postsNotifier,
        builder: (context, posts, _) {
          return posts.isNotEmpty
              ? Feed(posts: posts)
              : const Center(
                  child: Text('Empty feed'),
                );
        },
      ),
    );
  }
}
