// Calcular e exibir a área de um retângulo, a partir dos valores da
// base e altura que serão digitados. Se a área for maior que 100,
//exibir a mensagem “Terreno grande”, caso contrário,
//exibir a mensagem “Terreno pequeno”.

import 'utils/validarInputNumber.dart';

void main() {
  double base = validarInputNumber("Digite a base do retângulo", null);
  double altura = validarInputNumber("Digite a altura do retângulo", null);
  double area = (base * altura) / 2;
  if (area > 100) {
    return print('Terreno grande');
  }
  print('Terreno pequeno');
}
