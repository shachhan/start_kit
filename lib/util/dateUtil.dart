import 'package:intl/intl.dart';

class DateUtil {
  /// 주의 첫날 찾기
  static firstDayOfWeek({required DateTime date}) {
    DateTime result = DateTime(date.year, date.month, date.day - (date.weekday - 1));
    return result;
  }

  /// 주의 마지막날 찾기
  static lastDayOfWeek({required DateTime date}) {
    DateTime result = DateTime(date.year, date.month, date.day + (7 - date.weekday));
    return result;
  }

  /// quarter name 찾기
  static String quarterIs(DateTime date) {
    String q;
    if (date.month < 4) {
      q = '1분기';
    } else if (date.month < 7) {
      q = '2분기';
    } else if (date.month < 10) {
      q = '3분기';
    } else {
      q = '4분기';
    }

    return q;
  }

  /// half name 찾기
  static String halfIs(DateTime date) {
    String h;
    if (date.month < 7) {
      h = '상반기';
    } else {
      h = '하반기';
    }
    return h;
  }

  /// 날짜 형식 변환하기
  static String dateFormat(String dateStr, String format) {
    // regDateStr 형식: 2025-05-30 -> formatted : 2025.05.30 (월)
    final regExp = RegExp(r'^\d[\d.\-]*\d$');
    // logger.i('is Date Format? : ${regExp.hasMatch(dateStr)}');
    if (dateStr.isEmpty || !regExp.hasMatch(dateStr)) return dateStr;
    DateTime regDate = DateTime.parse(dateStr);
    String formattedDate = DateFormat(format,'ko').format(regDate);
    return formattedDate;
  }

  /// 포스팅 시간에 따른 경과 시간 문자열 반환하기
  static String formatElapsedTime(DateTime postTime) {
    final now = DateTime.now();
    final difference = now.difference(postTime);

    if (difference.inDays > 7) {
      return '${postTime.year}.${postTime.month}.${postTime.day}'; // 년.월.일 형식
    } else if (difference.inDays >= 2) {
      return '${difference.inDays}일 전';
    } else if (difference.inDays == 1) {
      return '어제';
    } else if (difference.inHours >= 1) {
      return '${difference.inHours}시간 전';
    } else if (difference.inMinutes >= 1) {
      return '${difference.inMinutes}분 전';
    } else {
      return '방금 전';
    }
  }
}