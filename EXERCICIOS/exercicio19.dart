// Armazenar vinte valores em um vetor. Após a digitação, entrar com
//uma constante multiplicativa que deverá multiplicar cada um dos
//valores do vetor e armazenar o resultado no próprio vetor, na
//respectiva posição.

import 'utils/validarInputNumber.dart';

void main() {
  final List<double> ns = List.generate(
      20, (int index) => validarInputNumber("Digite um valor", null));
  double n = validarInputNumber("Digite um valor para multiplicar", null);
  ns.forEach((e) => print(e * n));
}
