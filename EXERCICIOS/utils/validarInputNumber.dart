import 'dart:io';

void main() {}

/**
 * args[0]: Message will be display;
 * args[1]: Optional error message;
 */
double validarInputNumber(String message, String? optionalErrorMessage) {
  print(message);
  String input = stdin.readLineSync() ?? "";
  double output = double.tryParse(input) ?? -9999999999999;
  if (output == -9999999999999) {
    if (optionalErrorMessage != null) print(optionalErrorMessage);
    return validarInputNumber(message, optionalErrorMessage);
  }
  ;
  return output;
}
