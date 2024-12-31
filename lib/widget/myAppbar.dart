import 'package:flutter/material.dart';

class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppbar({
    super.key,
    required this.context,
    required this.backgroundColor,
    required this.title,
    this.titleTextStyle,
    this.iconSize,
    this.onBack,
    this.leading,
    this.actions,
  });
  final BuildContext context;
  final Color backgroundColor;
  final String title;
  final TextStyle? titleTextStyle;
  final double? iconSize;
  final VoidCallback? onBack;
  final Widget? leading;
  final List<Widget>? actions;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      centerTitle: true,
      title: Text(
        title,
      ),
      titleTextStyle: titleTextStyle,
      leading: leading,
      // leading: IconButton(
      //   icon: Icon(
      //     Icons.arrow_back,
      //     color: Colors.black,
      //     size: iconSize,
      //   ),
      //   onPressed: onBack ?? () => Navigator.pop(context),
      // ),
      actions: actions,
    );
  }
}