import 'package:easy_localization/easy_localization.dart';
import 'package:intl_phone_field/phone_number.dart';

class Validator {
  static String? defaultValidator(String? value) {
    if (value == null || value
        .trim()
        .isEmpty) {
      return tr('error_filed_required');
    }

    return null;
  }

  static String? otpValidator(String? value) {
    if (value == null || value
        .trim()
        .isEmpty || value.length < 4) {
      return tr('error_filed_required');
    }

    return null;
  }

  static String? commentValidator(String? value) {
    if (value == null || value
        .trim()
        .isEmpty) {
      return tr('comment_required');
    }

    return null;
  }

  static String? name(String? value) {
    if (value != null) {
      value = value.trim();
      if (value.isEmpty) {
        return tr('error_filed_required');
      }
      // if (value.split(' ').length < 2) {
      //   return tr('name_must_trio');
      // }
      if (value.length < 2) {
        return tr('name_short_input');
      }
    }
    return null;
  }

  // static String? fastOrder(String? value) {
  //   if (value != null) {
  //     value = value.trim();
  //     if (value.isEmpty) {
  //       return tr('error_filed_required');
  //     }
  //     if (value.length < 3) {
  //       return tr('name_short_input');
  //     }
  //   }
  //   return null;
  // }

  // static String? registerAddress(String? value) {
  //   if (value != null) {
  //     value = value.trim();
  //     if (value.isEmpty) {
  //       return tr('error_filed_required');
  //     }
  //     if (value.length < 4) {
  //       return tr('short_address');
  //     }
  //   }
  //   return null;
  // }

  // static String? text(String? value) {
  //   if (value != null) {
  //     value = value.trim();
  //     if (value.isEmpty) {
  //       return tr('error_filed_required');
  //     } else if (!RegExp('[a-zA-Z]').hasMatch(value)) {
  //       return tr('enter_correct_name');
  //     }
  //   }
  //   return null;
  // }

  // static String? defaultEmptyValidator(String? value) {
  //   return null;
  // }

  static String? optionalEmail(String? value) {
    if (value?.isNotEmpty ?? false) {
      value = value!.trim();
      if (!RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(value)) {
        return tr('error_email_regex');
      }
    }
    return null;
  }

  static String? email(String? value) {
    if (value != null) {
      value = value.trim();
      if (value.isEmpty) {
        return tr('error_filed_required');
      } else if (!RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(value)) {
        return tr('error_email_regex');
      }
    } else {
      return tr('error_filed_required');
    }
    return null;
    // return null;
    // return null;
  }

  static String? password(String? value) {
    RegExp strongPassword =
    RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[A-Za-z\d#@$!%*?&]{8,}$');
    if (value != null) {
      value = value.trim();
      if (value.isEmpty) {
        return tr('error_filed_required');
      }
      if (!strongPassword.hasMatch(value)) {
        return tr('error_password_validation');
      }
    }
    return null;
  }

  static String? confirmPassword(String? confirmPassword, String? password) {
    if (confirmPassword != null) {
      confirmPassword = confirmPassword.trim();
      if (confirmPassword.isEmpty) {
        return tr('error_filed_required');
      } else if (confirmPassword != password) {
        return tr('error_wrong_password_confirm');
      }
    } else {
      return tr('error_filed_required');
    }
    return null;
  }

  static String? numbers(String? value) {
    if (value != null) {
      value = value.trim();
      if (value.isEmpty) {
        return tr('error_filed_required');
      }
      if (value.startsWith('+')) {
        value = value.replaceFirst(r'+', '');
      }
      final int? number = int.tryParse(value);
      if (number == null) {
        return tr('error_wrong_input');
      }
    } else {
      return tr('error_filed_required');
    }
    return null;
  }

  // static String? phone(
  //   String? value,
  // ) {
  //   RegExp regExp = RegExp(r'^05\d{8}$');
  //   if (value == null || value.isEmpty) {
  //     return tr('error_filed_required');
  //   }
  //   if (!regExp.hasMatch(value)) {
  //     return tr('invalid_phone');
  //   }
  //   return null;
  // }

  static String? phone(String? value, PhoneNumber? phone) {
    if (value != null) {
      value = value.trim();
      value = value.replaceAll(r' ', '');
      if (value.isEmpty) {
        return tr('error_filed_required');
      }
      // if (phone.countryISOCode == 'SA') {
      //   if ((value.startsWith('5') || value.startsWith('٥')) &&
      //       value.length == 9) {
      //     value = value.replaceFirst(r'+', '');
      //   } else {
      //     return tr('sa_error_wrong_phone');
      //   }
      // } else
      if (phone?.countryISOCode == 'EG') {
        if ((value.startsWith('1') || value.startsWith('١')) &&
            value.length == 10) {
          value = value.replaceFirst(r'+', '');
        } else {
          return tr('eg_error_wrong_phone');
        }
      } else {
        if (value.length >= 6 && value.length <= 15) {
          value = value.replaceFirst(r'+', '');
        } else {
          return tr('any_error_wrong_phone');
        }
      }
      final int? number = int.tryParse(value);
      if (number == null) {
        return tr('error_wrong_input');
      }
    } else {
      return tr('error_filed_required');
    }
    return null;
  }

  bool containsArabicNumbers(String input) {
    // Arabic numerals range from \u0660 to \u0669
    final RegExp arabicNumbersRegExp = RegExp(r'[\u0660-\u0669]');
    return arabicNumbersRegExp.hasMatch(input);
  }
}