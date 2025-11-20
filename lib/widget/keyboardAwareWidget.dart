import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 키보드가 올라올 때 자동으로 패딩을 추가해주는 위젯
/// flutter_keyboard_visibility 플러그인을 사용하여 키보드 상태를 감지
class KeyboardAwarePadding extends StatelessWidget {
  const KeyboardAwarePadding({
    super.key,
    required this.child,
    this.keyboardPadding,
    this.animationDuration = const Duration(milliseconds: 300),
    this.curve = Curves.easeInOut,
  });

  final Widget child;
  final EdgeInsets? keyboardPadding;
  final Duration animationDuration;
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {
        // 키보드가 보일 때 사용할 패딩
        final EdgeInsets padding =
            keyboardPadding ??
            EdgeInsets.only(bottom: isKeyboardVisible ? 50.h : 0);

        return AnimatedPadding(
          duration: animationDuration,
          curve: curve,
          padding: padding,
          child: child,
        );
      },
    );
  }
}

/// 키보드 높이만큼 여백을 추가하는 위젯
/// 실제 키보드 높이를 계산하여 정확한 여백을 제공
class KeyboardHeightSpacer extends StatelessWidget {
  const KeyboardHeightSpacer({
    super.key,
    this.additionalHeight = 0,
    this.animationDuration = const Duration(milliseconds: 300),
    this.curve = Curves.easeInOut,
  });

  final double additionalHeight;
  final Duration animationDuration;
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {
        final double keyboardHeight = isKeyboardVisible
            ? MediaQuery.of(context).viewInsets.bottom + additionalHeight
            : 0;

        return AnimatedContainer(
          duration: animationDuration,
          curve: curve,
          height: keyboardHeight,
        );
      },
    );
  }
}

/// TextFormField를 키보드에 대응하여 자동으로 스크롤시키는 위젯
/// flutter_keyboard_visibility 플러그인을 사용하여 키보드 상태를 감지
/// 이 위젯은 TextFormField가 키보드에 의해 가려지지 않도록 자동으로 스크롤합니다.
class KeyboardAwareTextFormField extends StatefulWidget {
  const KeyboardAwareTextFormField({
    super.key,
    required this.controller,
    this.focusNode,
    this.scrollController,
    this.decoration,
    this.style,
    this.maxLines,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.keyboardType,
    this.textInputAction,
    this.scrollPadding,
    this.animationDuration = const Duration(milliseconds: 300),
    this.curve = Curves.easeInOut,
    this.obscureText,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final ScrollController? scrollController;
  final InputDecoration? decoration;
  final TextStyle? style;
  final int? maxLines;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final VoidCallback? onTap;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final EdgeInsets? scrollPadding;
  final Duration animationDuration;
  final Curve curve;
  final bool? obscureText;

  @override
  State<KeyboardAwareTextFormField> createState() =>
      _KeyboardAwareTextFormFieldState();
}

class _KeyboardAwareTextFormFieldState
    extends State<KeyboardAwareTextFormField> {
  late FocusNode _focusNode;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _scrollController = widget.scrollController ?? ScrollController();

    // 포커스가 변경될 때 스크롤 조정
    _focusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    if (widget.scrollController == null) {
      _scrollController.dispose();
    }
    super.dispose();
  }

  void _handleFocusChange() {
    if (_focusNode.hasFocus) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollToTextField();
      });
    }
  }

  void _scrollToTextField() {
    final RenderObject? renderObject = context.findRenderObject();
    if (renderObject == null) return;

    final RenderBox renderBox = renderObject as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero);
    final Size size = renderBox.size;

    final double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double textFieldBottom = offset.dy + size.height;

    // 키보드가 텍스트 필드를 가리는지 확인
    if (textFieldBottom > screenHeight - keyboardHeight) {
      final double scrollOffset =
          textFieldBottom - (screenHeight - keyboardHeight) + 50.h;

      _scrollController.animateTo(
        _scrollController.offset + scrollOffset,
        duration: widget.animationDuration,
        curve: widget.curve,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {
        return TextFormField(
          controller: widget.controller,
          focusNode: _focusNode,
          decoration: widget.decoration,
          style: widget.style,
          maxLines: widget.maxLines ?? 1,
          validator: widget.validator,
          onChanged: widget.onChanged,
          onFieldSubmitted: widget.onSubmitted,
          onTap: widget.onTap,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          scrollPadding:
              widget.scrollPadding ??
              EdgeInsets.only(bottom: isKeyboardVisible ? 100.h : 20.h),
          obscureText: widget.obscureText ?? false,
        );
      },
    );
  }
}

/// SingleChildScrollView와 함께 사용하는 키보드 대응 위젯
class KeyboardAwareScrollView extends StatelessWidget {
  const KeyboardAwareScrollView({
    super.key,
    required this.child,
    this.controller,
    this.physics,
    this.padding,
    this.reverse = false,
    this.keyAxisKeyboardPadding = 50.0,
    this.animationDuration = const Duration(milliseconds: 300),
    this.curve = Curves.easeInOut,
  });

  final Widget child;
  final ScrollController? controller;
  final ScrollPhysics? physics;
  final EdgeInsetsGeometry? padding;
  final bool reverse;
  final double keyAxisKeyboardPadding;
  final Duration animationDuration;
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {
        final EdgeInsetsGeometry finalPadding =
            padding?.add(
              EdgeInsets.only(
                bottom: isKeyboardVisible ? keyAxisKeyboardPadding.h : 0,
              ),
            ) ??
            EdgeInsets.only(
              bottom: isKeyboardVisible ? keyAxisKeyboardPadding.h : 0,
            );

        return AnimatedPadding(
          duration: animationDuration,
          curve: curve,
          padding: finalPadding,
          child: SingleChildScrollView(
            controller: controller,
            physics: physics,
            reverse: reverse,
            child: child,
          ),
        );
      },
    );
  }
}

/// 키보드가 올라올 때 특정 위젯을 숨기는 위젯
class KeyboardHideWidget extends StatelessWidget {
  const KeyboardHideWidget({
    super.key,
    required this.child,
    this.hideOnKeyboard = true,
    this.animationDuration = const Duration(milliseconds: 200),
    this.curve = Curves.easeInOut,
  });

  final Widget child;
  final bool hideOnKeyboard;
  final Duration animationDuration;
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {
        final bool shouldHide = hideOnKeyboard && isKeyboardVisible;

        return AnimatedOpacity(
          duration: animationDuration,
          curve: curve,
          opacity: shouldHide ? 0.0 : 1.0,
          child: AnimatedContainer(
            duration: animationDuration,
            curve: curve,
            height: shouldHide ? 0 : null,
            child: shouldHide ? const SizedBox.shrink() : child,
          ),
        );
      },
    );
  }
}
