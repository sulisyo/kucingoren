import 'package:oren/app/feature_a/domain/text_editing_value_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class CardFormatter extends TextInputFormatter {
  final String sample;
  final String separator;

  CardFormatter({
    required this.sample,
    required this.separator
  }) {}

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue,
      TextEditingValue newValue) {
    if(newValue.text.isNotEmpty) {
      if (newValue.isLongerThan(oldValue)) {
        if (newValue.isLongerThanString(sample)) return oldValue;
        if (newValue.isShorterThanString(sample) &&
            sample[newValue.text.length - 1] == separator[0]) {
          return TextEditingValue(
              text: '${oldValue.text}$separator${newValue.text.substring(
                  newValue.text.length - 1)}',
              selection: TextSelection.collapsed(
                  offset: newValue.selection.end + 1)
          );
        }
      }
    }
    return newValue;
  }
}