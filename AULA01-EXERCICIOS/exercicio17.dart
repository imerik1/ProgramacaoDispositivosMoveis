// Armazenar dez números na memória do computador.
//Exibir os valores na ordem inversa à da digitação.

import 'utils/validarInputNumber.dart';

void main() {
  final List<double> ns = List.generate(
      10, (int index) => validarInputNumber("Digite um valor", null));
  for (int i = ns.length - 1; i >= 0; i--) {
    print('Indice $i: ${ns[i]}');
  }
}
