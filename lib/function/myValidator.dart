class MyValidator {
  static String? emptyCheck(String char) {
    if (char.isEmpty) {
      return '필수입력 항목입니다.';
    }
    return null;
  }

  static String? lengthCheck(String? v, int length, String errorText) {
    if (v!.isEmpty) {
      return '필수입력 항목입니다.';
    } else if(v.length != length) {
      return errorText;
    }
    return null;
  }

  static String? nameValidator(String char) {
    var regExp = RegExp(r'^(?=.*[ㄱ-ㅎ가-힣])');
    if (char.isEmpty) {
      return '필수입력 항목입니다.';
    } else if (!regExp.hasMatch(char)) {
      return '한글 이름을 입력하시기 바랍니다.';
    }
    return null;
  }

  static String? userIdValidator(String? char) {
    var regExp = RegExp(r'^(?=.*[a-zA-Z\d]){4,20}');
    // logger.i('char : $char');
    if (char!.isEmpty) {
      return '필수입력 항목입니다.';
    } else if (!regExp.hasMatch(char)) {
      return '영문 대소문자, 숫자만 입력가능합니다.';
    }
    return null;
  }

  static String? passwordValidator(String? char) {
    // var regExp = RegExp(r'^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*;:~])[a-zA-Z\d!@#$%^&*;:~]{6,15}');
    var regExp = RegExp(r'^(?=.*[a-zA-Z\d!@#$%^]){6,15}');
    if (char!.isEmpty) {
      return '필수입력 항목입니다.';
    } else if (!regExp.hasMatch(char)) {
      return '영문 대소문자, 숫자, 특수문자로 6~15자 입니다.';
    } else {
      return null;
    }
  }

  static String? bizTypeCodeNameValidator(String char) {
    var regExp = RegExp(r'^(?=.*[ㄱ-ㅎ가-힣])');
    if (char.isEmpty) {
      return '필수입력 항목입니다.';
    } else if (!regExp.hasMatch(char)) {
      return '한글로 입력하시기 바랍니다.';
    }
    return null;
  }

  static String? krValidator(String char) {
    var regExp = RegExp(r'^(?=.*[ㄱ-ㅎ가-힣])');
    if (char.isEmpty) {
      return '필수입력 항목입니다.';
    } else if (!regExp.hasMatch(char)) {
      return '한글로 입력하시기 바랍니다.';
    }
    return null;
  }
}