// Armazenar dez valores na memória do computador. Após a digitação dos valores,
// criar uma rotina para ler os valores e achar e exibir o maior deles.

import 'utils/validarInputNumber.dart';

void main() {
  final List<double> ns = List.generate(
      10, (int index) => validarInputNumber("Digite um valor", null));
  double max = ns.reduce((value, element) => element > value ? element : value);
  print(max);
}
