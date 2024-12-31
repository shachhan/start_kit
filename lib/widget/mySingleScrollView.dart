import 'package:flutter/material.dart';

class MySingleScrollView extends StatelessWidget {
  const MySingleScrollView({super.key, required this.child, this.controller});
  final Widget child;
  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (OverscrollIndicatorNotification overscroll) {
        overscroll.disallowIndicator();
        return true;
      },
      child: SingleChildScrollView(
        controller: controller,
        physics: const ClampingScrollPhysics(),
        child: child,
      ),
    );
  }
}