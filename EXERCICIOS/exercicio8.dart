// Entrar com o peso e a altura de uma determinada pessoa. Após a digitação,
// exibir se esta pessoa está ou não com seu peso ideal. Fórmula: peso/altura².

import 'dart:math';

import 'utils/validarInputNumber.dart';

void main() {
  final double peso = validarInputNumber("Digite seu peso (em KG)", null);
  double altura = validarInputNumber("Digite sua altura (em M)", null);
  if (altura > 2.30) {
    altura = altura / 100;
  }
  double imc = peso / pow(altura, 2);
  if (imc > 18.6 && imc < 24.9) {
    return print('Seu IMC é ideal, o valor é $imc');
  }
  print('Seu IMC não é ideal, o valor é $imc');
}
