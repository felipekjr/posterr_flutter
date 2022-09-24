import 'package:flutter/material.dart';
import 'package:posterr_design_system/posterr_design_system.dart';

class BasePage extends StatefulWidget {
  final Widget child;
  final CustomAppBar? customAppBar;
  final String? title;

  const BasePage({
    super.key,
    required this.child,
    this.title,
    this.customAppBar,
  });

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.customAppBar ??
          CustomAppBar(
            title: widget.title ?? '',
          ),
      floatingActionButton: CustomFloatActionButton(
          icon: Icons.add_outlined,
          onTap: () {
            showPostModal(
              context,
              onSave: (String v) {
              },
            );
          }),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            Spacing.x1,
            Spacing.x1,
            Spacing.x1,
            0,
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
