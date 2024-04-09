import 'package:flutter/services.dart';

class Validations {
  static TextInputFormatter trimSpaces() {
    return TrimSpaceTextInputFormatter();
  }

  static OnlyNumbersTextInputFormatter onlyNumbers() {
    return OnlyNumbersTextInputFormatter();
  }

  static TextInputFormatter emptyValidator() {
    return FilteringTextInputFormatter.allow(RegExp(r'^.*?\S.*$'));
  }

  // static FormFieldValidator<String> emptyValidator({
  //   String errorMessage = 'This field cannot be empty',
  // }) {
  //   return (value) {
  //     if (value == null || value.trim().isEmpty) {
  //       return errorMessage;
  //     }
  //     return null;
  //   };
  // }
}

class TrimSpaceTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
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
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Allow only numeric characters
    final newText = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');
    // Return the modified text value
    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
