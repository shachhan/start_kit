
import 'package:flutter/material.dart';

class StatusBarPadding extends StatelessWidget {
  const StatusBarPadding({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(height: MediaQuery.of(context).padding.top);
  }
}