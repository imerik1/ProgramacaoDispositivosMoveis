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
	if (sexo == "M") {
    if (imc < 20) return print('Seu IMC está abaixo do peso, o valor é $imc');
		if (imc >= 20 && imc < 25) return print('Seu IMC é ideal, o valor é $imc');
		if (imc >= 25) return print('Seu IMC está acima do peso, o valor é $imc');
  }
	if (sexo == "F") {
    if (imc < 19) return print('Seu IMC está abaixo do peso, o valor é $imc');
		if (imc >= 19 && imc < 24) return print('Seu IMC é ideal, o valor é $imc');
		if (imc >= 24) return print('Seu IMC está acima do peso, o valor é $imc');
  }
}
