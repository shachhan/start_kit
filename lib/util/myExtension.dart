import 'numberFormat.dart';

extension ListExtension on List {
  /// Returns a new list with the elements of the original list in reverse order.
  bool get isOneAndOnly {
    if (isEmpty) return false;
    if (length == 1) return true;
    return false;
  }
}

extension StringExtension on String {

  /// Checks if the string is a valid number and returns it as an integer.
  /// If the string is not a valid number, it returns 0.
  /// Example: '123' returns 123, 'abc' returns 0.
  int get toIntIfIsNumber {
    final RegExp numberRegExp = RegExp(r'^(?=.*[\d])');
    if (numberRegExp.hasMatch(this)) {
      return int.parse(this);
    } else {
      return 0;
    }
  }

  /// Adds thousand separators to the string if it represents a valid number.
  /// If the string is not a valid number, it returns the original string.
  /// Example: '1000' returns '1,000', 'abc' returns 'abc'.
  String get addThousandSeparatorIfIsNumber {
    final RegExp regExp = RegExp(r'^\d+$');
    if (!regExp.hasMatch(this)) {
      return this; // Return the original string if it is not a valid number
    }
    final intString = int.parse(this);
    return numb.format(intString);
  }

  /// Adds thousand separators and appends '원' to the string if it represents a valid number.
  /// If the string is not a valid number, it returns the original string.
  /// Example: '1000' returns '1,000원', 'abc' returns
  String get addThousandSeparatorAndWonIfIsNumber {
    final RegExp regExp = RegExp(r'^\d+$');
    if (!regExp.hasMatch(this)) {
      return this; // Return the original string if it is not a valid number
    }
    final intString = int.parse(this);
    return '${numb.format(intString)}원';
  }

  /// Formats a 6-digit string as a birth date in the format yy.MM.dd
  String get getBirthSixDigit {
    if (isEmpty) {
      return this; // Return the original string if it is empty
    }

    final RegExp regExp = RegExp(r'^\d{0,6}$');
    if (!regExp.hasMatch(this)) {
      return this; // Return the original string if it is not a valid six-digit number
    }
    return '${substring(0, 2)}.${substring(2, 4)}.${substring(4, 6)}';
  }

  /// Converts an 8-digit string in the format YYYYMMDD to YYYY.MM.DD
  String get toDateStringWithDot {
    if (length != 8) {
      return this; // Return the original string if it is not 8 characters long
    }
    final RegExp regExp = RegExp(r'^\d{8}$');
    if (!regExp.hasMatch(this)) {
      return this; // Return the original string if it is not a valid eight-digit number
    }
    return '${substring(0, 4)}.${substring(4, 6)}.${substring(6, 8)}';
  }

  /// Safely converts the string to double.
  double get toSafeDouble {
    if (isEmpty) {
      return 0;
    } else {
      return double.parse(this);
    }
  }
}
