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

  String get addThousandSeparatorIfIsNumber {
    final RegExp regExp = RegExp(r'^\d+$');
    if (!regExp.hasMatch(this)) {
      return this; // Return the original string if it is not a valid number
    }
    final intString = int.parse(this);
    return numb.format(intString);
  }

  String get addThousandSeparatorAndWonIfIsNumber {
    final RegExp regExp = RegExp(r'^\d+$');
    if (!regExp.hasMatch(this)) {
      return this; // Return the original string if it is not a valid number
    }
    final intString = int.parse(this);
    return '${numb.format(intString)}원';
  }
}