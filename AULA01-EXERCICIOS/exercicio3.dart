// Calcular e exibir a média aritmética de
//quatro valores quaisquer que serão digitados.

import 'utils/validarInputNumber.dart';

void main() {
  double n1 = validarInputNumber("Digite o primeiro valor", null);
  double n2 = validarInputNumber("Digite o segundo valor", null);
  double n3 = validarInputNumber("Digite o terceiro valor", null);
  double n4 = validarInputNumber("Digite o quarto valor", null);
  final double media = (n1 + n2 + n3 + n4) / 4;
  print('A media aritmetica $media');
}
