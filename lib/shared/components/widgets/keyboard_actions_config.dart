import 'package:flutter/material.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:keyboard_actions/keyboard_actions_item.dart';

KeyboardActionsConfig buildConfig(BuildContext context,lstNodeText) {
  return KeyboardActionsConfig(
    keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
    keyboardBarColor: Colors.red,
    nextFocus: false,
    actions:lstNodeText,

  );
}