// A partir de três valores que serão digitados, verificar se formam ou
//não um triângulo. Em caso positivo, exibir sua classificação:
//“Isósceles, escaleno ou eqüilátero”. Um triângulo escaleno
//possui todos os lados diferentes, o isósceles, dois lados iguais e o
//eqüilátero, todos os lados iguais. Para existir triângulo é necessário que
//a soma de dois lados quaisquer seja maior que o outro, isto,
//para os três lados

import 'utils/validarInputNumber.dart';

void main() {
  double lado1 = validarInputNumber("Digite o primeiro lado", null);
  double lado2 = validarInputNumber("Digite o segundo lado", null);
  double lado3 = validarInputNumber("Digite o terceiro lado", null);
  if ((lado1 + lado2) > lado3 || (lado1 + lado3) > lado2) {
    if (lado1 != lado2 || lado1 != lado3 || lado2 != lado3) {
      return print('Escaleno');
    }
    if (lado1 == lado2 || lado1 == lado3 || lado2 == lado3) {
      return print('Isósceles');
    }
    return print('Eqüilátero');
  }
  print('Não é triangulo.');
}
