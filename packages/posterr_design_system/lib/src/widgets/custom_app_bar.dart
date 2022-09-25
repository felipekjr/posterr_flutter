import 'package:flutter/material.dart';
import 'package:posterr_design_system/posterr_design_system.dart';

import '../theme/theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? action;
  final double? height;
  final bool hideLeading;
  final TabBar? tabBar;
  final Widget title;
  final Color? color;

  const CustomAppBar(
      {Key? key,
      required this.title,
      this.tabBar,
      this.height,
      this.hideLeading = false,
      this.action,
      this.color})
      : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height ?? 40);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: !hideLeading
          ? IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: AppColors.black,
              ),
              onPressed: () => Navigator.of(context).pop(),
            )
          : null,
      actions: action != null ? [action!] : [],
      bottom: tabBar,
      automaticallyImplyLeading: false,
      elevation: 2,
      backgroundColor: color ?? AppColors.white,
      iconTheme: Theme.of(context).iconTheme,
      title: title
    );
  }
}
