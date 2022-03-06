//Entrar via teclado com o valor de uma temperatura em graus Celsius,
//calcular e exibir sua temperatura equivalente em Fahrenheit.

import 'utils/validarInputNumber.dart';

void main() {
  double celsius = validarInputNumber("Digite a temperatura em Celsius", null);
  final double fahrenheit = celsius * 1.8 + 32;
  print('Fahrenheit $fahrenheit');
}
