class DateUtil {
  // 주의 첫날 찾기
  static firstDayOfWeek({required DateTime date}) {
    DateTime result = DateTime(date.year, date.month, date.day - (date.weekday - 1));
    return result;
  }

  // 주의 마지막날 찾기
  static lastDayOfWeek({required DateTime date}) {
    DateTime result = DateTime(date.year, date.month, date.day + (7 - date.weekday));
    return result;
  }

  // quarter name 찾기
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

  // half name 찾기
  static String halfIs(DateTime date) {
    String h;
    if (date.month < 7) {
      h = '상반기';
    } else {
      h = '하반기';
    }
    return h;
  }
}