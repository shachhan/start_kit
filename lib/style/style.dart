
import 'package:flutter/material.dart';
import 'myFont.dart';

class ColorPalette {
  static const black = Color(0xff333333);
  static const grey = Color(0xff999999);
  static const greyDark = Color(0xff595959);
  static const borderGrey = Color(0xffafafaf);
  static const borderLightGrey = Color(0xffc6c6c6);
}

class TextGuide {
  static const notoRegular16 = TextStyle(
    color: ColorPalette.black,
    fontSize: 16,
    fontFamily: NotoSansKr.fontFamily,
    fontWeight: NotoSansKr.regular,
  );

  static const nanumSquareRegular16 = TextStyle(
    color: ColorPalette.black,
    fontSize: 16,
    fontFamily: NanumSquare.fontFamily,
    fontWeight: NanumSquare.regular,
  );
}