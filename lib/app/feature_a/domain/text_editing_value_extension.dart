
import 'package:flutter/cupertino.dart';

extension TextEdit on TextEditingValue {
  bool isLongerThan(TextEditingValue other){
    return text.length > other.text.length;
  }

  bool isShorterThan(TextEditingValue other){
    return text.length < other.text.length;
  }

  bool isSameLengthWith(TextEditingValue other){
    return text.length == other.text.length;
  }
  bool isLongerThanString(String other){
    return text.length > other.length;
  }

  bool isShorterThanString(String other){
    return text.length < other.length;
  }

  bool isSameLengthWithString(String other){
    return text.length == other.length;
  }
}