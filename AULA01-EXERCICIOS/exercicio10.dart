// Entrar com o peso, o sexo e a altura de uma determinada pessoa. Após a
//digitação, exibir se esta pessoa está ou não
//com seu peso ideal. Fórmula: peso/altura².

import 'dart:math';

import 'utils/validarInputNumber.dart';
import 'utils/validarInputString.dart';

String validarSexo() {
  String sexo =
      validarInputString("Digite seu sexo (F ou M)", "").toUpperCase();
  while (0 == 0) {
    if (sexo != "M" || sexo != "F") {
      validarSexo();
    }
    break;
  }
  return sexo;
}

void main() {
  final double peso = validarInputNumber("Digite seu peso (em KG)", null);
  double altura = validarInputNumber("Digite sua altura (em M)", null);
  if (altura > 2.30) {
    altura = altura / 100;
  }
  final String sexo = validarSexo();
  double imc = peso / pow(altura, 2);
  if (imc > 20 && imc < 24.9 && sexo == "M") {
    return print('Seu IMC é ideal, o valor é $imc');
  }
  if (imc > 19 && imc < 23.9 && sexo == "F") {
    return print('Seu IMC é ideal, o valor é $imc');
  }
  print('Seu IMC não é ideal, o valor é $imc');
}
