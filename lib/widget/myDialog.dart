import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:start_kit01/style/style.dart';

class ErrDialog extends StatelessWidget {
  final String content;
  final Function()? onPressed;

  const ErrDialog({super.key, required this.content, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 40.h),
      content: Text(content, textAlign: TextAlign.center),
      contentTextStyle: TextGuide.notoRegular16.copyWith(fontSize: 14.sp),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
                textStyle: TextGuide.notoRegular16.copyWith(fontSize: 14.sp),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.r),
                ),
              ),
              child: const Text('확인'),
            ),
          ],
        ),
      ],
    );
  }
}

class LogoutDialog extends StatelessWidget {
  final String content;
  final VoidCallback? onLogout;
  final VoidCallback? onCancel;

  const LogoutDialog({super.key, required this.content, this.onLogout, this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 40.h),
      content: Text(content, textAlign: TextAlign.center),
      contentTextStyle: TextGuide.notoRegular16.copyWith(fontSize: 14.sp),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        SizedBox(width: 100.w,
          child: ElevatedButton(
            onPressed: onLogout,
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: Colors.indigo,
              foregroundColor: Colors.white,
              textStyle: TextGuide.notoRegular16.copyWith(fontSize: 14.sp),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.r),
              ),
            ),
            child: const Text('로그아웃'),
          ),
        ),
        SizedBox(width: 100.w,
          child: ElevatedButton(
            onPressed: onCancel,
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              textStyle: TextGuide.notoRegular16.copyWith(fontSize: 14.sp),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.r),
              ),
            ),
            child: const Text('취소'),
          ),
        ),
      ],
    );
  }
}

class ConfirmDialog extends StatelessWidget {
  final String content;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;

  const ConfirmDialog({super.key, required this.content, this.onConfirm, this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 40.h),
      content: Text(content, textAlign: TextAlign.center),
      contentTextStyle: TextGuide.notoRegular16.copyWith(fontSize: 14.sp),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        SizedBox(width: 100.w,
          child: ElevatedButton(
            onPressed: onConfirm,
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: Colors.indigo,
              foregroundColor: Colors.white,
              textStyle: TextGuide.notoRegular16.copyWith(fontSize: 14.sp),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.r),
              ),
            ),
            child: const Text('확인'),
          ),
        ),
        SizedBox(width: 100.w,
          child: ElevatedButton(
            onPressed: onCancel,
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              textStyle: TextGuide.notoRegular16.copyWith(fontSize: 14.sp),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.r),
              ),
            ),
            child: const Text('취소'),
          ),
        ),
      ],
    );
  }
}

class InfoDialog extends StatelessWidget {
  const InfoDialog({super.key,
    required this.title,
    required this.children,
  });
  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            decoration: BoxDecoration(
              color: Colors.indigo,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r),
              ),
            ),
            child: Center(child: Text(title, style: TextGuide.notoRegular16.copyWith(color: Colors.white),)),
          ),
          Padding(
            padding: EdgeInsets.all(10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            ),
          ),
        ],
      ),
    );
  }
}