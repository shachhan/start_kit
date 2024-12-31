import 'package:flutter/material.dart';
import 'package:start_kit01/style/style.dart';

class MyPlaceholder extends StatelessWidget {
  const MyPlaceholder({
    super.key,
    this.size = const Size(300, 300),
    required this.someText,
  });
  final Size size;
  final String someText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        border: Border.all(color: Colors.grey),
      ),
      child: Center(
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            '<$someText 영역>',
            style: TextGuide.notoRegular16.copyWith(fontSize: 14),
          ),
        ),
      ),
    );
  }
}
