import 'package:flutter/material.dart';

class TextEditingControllerWithCursorPosition extends TextEditingController {
  TextEditingControllerWithCursorPosition({String text}) : super(text: text);

  @override
  set text(String newText) {
    value = value.copyWith(
      text: newText,
      selection: value.selection,
      composing: TextRange.empty,
    );
  }
}
