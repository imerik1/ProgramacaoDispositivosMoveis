// Entrar via teclado com a base e a altura de um retângulo,
//calcular e exibir sua área.
import 'utils/validarInputNumber.dart';

void main() {
  double base = validarInputNumber("Digite a base do retângulo", null);
  double altura = validarInputNumber("Digite a altura do retângulo", null);
  final double area = (base * altura) / 2;
  print('A área do retangulo é $area');
}
