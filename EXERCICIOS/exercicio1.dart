// Calcular média artimetica.
import './utils/validarInputNumber.dart';

void main() {
  double n1 = validarInputNumber("Digite o primeiro valor", null);
  double n2 = validarInputNumber("Digite o segundo valor", null);
  final double media = (n1 + n2) / 2;
  print('A media aritmetica $media');
}
