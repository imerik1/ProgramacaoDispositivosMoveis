import 'dart:io';

void main() {}
/**
 * args[0]: Optional message will be display;
 * args[1]: Optional error message;
 */
String validarInputString(String? message, String? optionalErrorMessage) {
  if (message != null) print(message);
  String input = stdin.readLineSync() ?? "";
  if (input.length == 0) {
    if (optionalErrorMessage != null) print(optionalErrorMessage);
    return validarInputString(message, optionalErrorMessage);
  }
  ;
  return input;
}
