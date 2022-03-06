// Entrar via teclado com um valor qualquer. Após a digitação,
//exibir a tabuada do valor solicitado, no intervalo de um a dez.

import 'utils/validarInputNumber.dart';

void main() {
  final double v =
      validarInputNumber("Digite o valor a ser multiplicado", null);
  for (int i = 1; i <= 10; i++) {
    double j = v * i;
    print('$v * $i = $j');
  }
}
