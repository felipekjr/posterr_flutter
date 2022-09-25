import 'package:flutter/material.dart';
import 'package:posterr_design_system/posterr_design_system.dart';
import 'package:posterr_flutter/src/presentation/helpers/helpers.dart';

class BasePage extends StatefulWidget {
  final Widget child;
  final CustomAppBar? customAppBar;
  final String? title;
  final ValueNotifier<UIState> stateNotifier;
  final Function(String) onSaveCreatePostModal;

  const BasePage({
    super.key,
    required this.child,
    required this.stateNotifier,
    required this.onSaveCreatePostModal,
    this.title,
    this.customAppBar,
  });

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  @override
  void initState() {
    widget.stateNotifier.addListener(() {
      final state = widget.stateNotifier.value;
      if (state is UIErrorState) {
        showErrorDialog(context, message: state.description);
      }
      if (state is UISuccessState) {
        showSuccessToast(message: state.description);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<UIState>(
      valueListenable: widget.stateNotifier,
      builder: (context, state, _) {
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
                  onSave: widget.onSaveCreatePostModal,
                );
              },),
          body: widget.child,
        );
      }
    );
  }
}
