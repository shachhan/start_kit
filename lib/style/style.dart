
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

  static const primary = Color(0xffFED400);
  static const secondary = Color(0xff02cebb);
  static const background = Color(0xfff8faf9);
  static const appbarBack = Color(0xffffdf00);
  static const overlay = Color(0x2f02cebb);
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