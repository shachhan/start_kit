import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../style/myFont.dart';
import '../style/style.dart';

class CommonContainer extends StatelessWidget {
  const CommonContainer({
    super.key,
    this.height,
    this.padding,
    this.boxDecoration,
    this.child,
  });
  final double? height;
  final EdgeInsets? padding;
  final Decoration? boxDecoration;
  final Widget? child;

  factory CommonContainer.error({required String message}) {
    return CommonContainer(
      height: 90.h,
      padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 15.h),
      boxDecoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.r),
        // boxShadow: [
        //   BoxShadow(
        //     color: Color(0xffd5d5d5).withValues(alpha: 0.5),
        //     blurRadius: 6.r,
        //     offset: const Offset(0, 0),
        //   ),
        // ],
      ),
      child: Center(
        child: Text(
          message,
          style: TextStyle(
            fontFamily: NotoSansKr.font,
            fontWeight: NotoSansKr.regular,
            color: ColorPalette.greyDark,
            fontSize: 14.sp,
          ),
        ),
      ),
    );
  }

  factory CommonContainer.info({Widget? child}) {
    return CommonContainer(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
      boxDecoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.r),
        boxShadow: [
          BoxShadow(
            color: Color(0xffe8e8e8).withValues(alpha: 0.5),
            spreadRadius: 0,
            blurRadius: 3,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      padding: padding,
      decoration: boxDecoration,
      child: child,
    );
  }
}
