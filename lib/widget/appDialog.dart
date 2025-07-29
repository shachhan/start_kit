import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../style/style.dart';

class AppDialog extends StatelessWidget {
  const AppDialog({
    super.key,
    required this.content,
    this.confirmButtonText = '확인',
    this.onConfirm,
    this.onCancel,
    this.textStyle,
    this.isLoading = false,
    this.isConfirm = false,
  });
  final String content;
  final String confirmButtonText;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;
  final TextStyle? textStyle;
  final bool isLoading;
  final bool isConfirm;

  factory AppDialog.loading({
    String loadingMessage = '로딩중',
    TextStyle? textStyle,
  }) {
    return AppDialog(
      content: loadingMessage,
      isLoading: true,
      textStyle: textStyle,
    );
  }
  
  factory AppDialog.error({
    required String errorMessage,
    VoidCallback? onPressed,
    TextStyle? textStyle,
  }) {
    return AppDialog(
      content: errorMessage,
      onConfirm: onPressed,
      textStyle: textStyle,
    );
  }

  factory AppDialog.confirm({
    required String message,
    String confirmButtonText = '확인',
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    TextStyle? textStyle,
  }) {
    return AppDialog(
      content: message,
      confirmButtonText: confirmButtonText,
      onConfirm: onConfirm,
      onCancel: onCancel,
      textStyle: textStyle,
      isConfirm: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!isLoading) {
      return AlertDialog(
        backgroundColor: ColorPalette.background,
        contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 40.h),
        contentTextStyle: textStyle,
        actionsAlignment: MainAxisAlignment.center,
        content: Text(content, textAlign: TextAlign.center),
        actions: isConfirm ? [
          SizedBox(width: 100.w,
            child: ElevatedButton(
              onPressed: onCancel,
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.white,
                foregroundColor: ColorPalette.black,
                textStyle: textStyle,
                side: BorderSide(color: ColorPalette.borderLightGrey),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.r),
                ),
              ),
              child: const Text('취소'),
            ),
          ),
          SizedBox(width: 100.w,
            child: ElevatedButton(
              onPressed: onConfirm,
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
                textStyle: textStyle,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.r),
                ),
              ),
              child: Text(confirmButtonText),
            ),
          ),
        ] : [
          SizedBox(width: 100.w,
            child: ElevatedButton(
              onPressed: onConfirm,
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
                textStyle: textStyle,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.r),
                ),
              ),
              child: Text(confirmButtonText),
            ),
          ),
        ],
      );
    }
    return Dialog(
      backgroundColor: ColorPalette.background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 40),
          SpinKitFadingCircle(color: Color(0xffFED400),),
          const SizedBox(height: 10),
          Text('..$content..', style: textStyle,),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
