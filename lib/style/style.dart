
import 'package:flutter/material.dart';
import 'myFont.dart';

class ColorPalette {
  const ColorPalette._();

  static const black = Color(0xff333333);
  static const grey = Color(0xff999999);
  static const greyDark = Color(0xff666666);
  static const greyDark2 = Color(0xff595959);
  static const borderGrey = Color(0xffafafaf);
  static const borderLightGrey = Color(0xffc6c6c6);
}

class TextGuide {
  const TextGuide._();

  static const notoRegular16 = TextStyle(
    fontFamily: NotoSansKr.fontFamily,
    fontWeight: NotoSansKr.regular,
    color: ColorPalette.black,
    fontSize: 16,
  );

  static const nanumSquareRegular16 = TextStyle(
    fontFamily: NanumSquare.fontFamily,
    fontWeight: NanumSquare.regular,
    color: ColorPalette.black,
    fontSize: 16,
  );

  static const nanumRegular16 = TextStyle(
    fontFamily: Nanum.fontFamily,
    fontWeight: Nanum.regular,
    color: ColorPalette.black,
    fontSize: 16,
  );
}