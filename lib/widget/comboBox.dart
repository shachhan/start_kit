import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../style/myFont.dart';
import '../style/style.dart';

class ComboBox extends StatelessWidget {
  const ComboBox({
    super.key,
    required this.title,
    required this.value,
    this.comboTap,
  });

  final String title;
  final String value;
  final VoidCallback? comboTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: comboTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: ColorPalette.background,
          border: Border.all(color: const Color(0xffdddddd)),
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Row(
          children: [
            Text(title,
              style: TextStyle(
                fontFamily: NotoSansKr.font,
                fontWeight: NotoSansKr.medium,
                color: ColorPalette.greyDark,
                fontSize: 14.sp,
              ),
            ),
            SizedBox(width: 13.w),
            Text(value,
              style: TextStyle(
                fontFamily: NotoSansKr.font,
                fontWeight: NotoSansKr.medium,
                color: ColorPalette.black,
                fontSize: 14.sp,
              ),
            ),
            const Spacer(),
            Icon(Icons.keyboard_arrow_down_rounded, color: ColorPalette.black),
          ],
        ),
      ),
    );
  }
}