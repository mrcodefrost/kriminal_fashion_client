import 'package:flutter/services.dart';

class RegexConstants {
  static String fontName = 'Poppins';
  static String mobileNumberRegex = r'^(?:[+0]9)?[0-9]{10}$';
  static String emailRegex =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
}

class RegexValidators {
  static RegExp mobileNumberRegex = RegExp(RegexConstants.mobileNumberRegex);
  static RegExp emailRegex = RegExp(RegexConstants.emailRegex);
}

class InputFormatter {
  static TextInputFormatter trimSpaces() {
    return TrimSpaceTextInputFormatter();
  }

  static OnlyNumbersTextInputFormatter onlyNumbers() {
    return OnlyNumbersTextInputFormatter();
  }

  static TextInputFormatter emptyValidator() {
    return FilteringTextInputFormatter.allow(RegExp(r'^.*?\S.*$'));
  }
}

class Validations {
  static String? Function(String?)? isEmptyValidator = (String? value) {
    var val = value?.trim();
    if (val!.isEmpty) {
      return "Required";
    } else {
      return null;
    }
  };

  static String? Function(String?)? mobileNumberValidator = (String? value) {
    var val = value?.trim();
    if (val!.isEmpty) {
      return 'Mobile number must be entered';
    } else if (val.isNotEmpty && val.length != 10) {
      return 'Mobile number should be exactly 10 digits';
    } else if (!RegExp(r'^[6-9]').hasMatch(val)) {
      return 'Mobile number must start with 6, 7, 8, or 9';
    } else {
      return null;
    }
  };
  static String? Function(String?)? isTouchedEmailValidator = (String? value) {
    var val = value?.trim();
    if (val!.isEmpty) {
      return "Required";
    } else if (!RegexValidators.emailRegex.hasMatch(val)) {
      return 'Enter Valid E-mail';
    } else {
      return null;
    }
  };
}

class TrimSpaceTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // Trim leading and trailing spaces from the input value
    final trimmedValue = newValue.text.trim();
    // Return the trimmed value
    return TextEditingValue(
      text: trimmedValue,
      selection: TextSelection.collapsed(offset: trimmedValue.length),
    );
  }
}

class OnlyNumbersTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // Allow only numeric characters
    final newText = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');
    // Return the modified text value
    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
