// Calcular e exibir a soma dos “N” primeiros valores da
//seqüência abaixo. O valor “N” será digitado, deverá ser
//positivo, mas menor que cem. Caso o valor não satisfaça a restrição,
//enviar mensagem de erro e solicitar o valor novamente.
// A seqüência: 2, 5, 10, 17, 26, ....

// se o valor for 1 retorna 2;
// somar o numero anterior com o proximo numero impar

import 'utils/validarInputNumber.dart';

int def(int v, int i) {
  return v == 1 ? 2 : def(v - 1, i - 2) + i;
}

void main() {
  final double n = validarInputNumber("Digite um valor", null);
  if (n < 0 || n > 100) {
    print('Valor invalido.');
    print('Digite novamente.');
    main();
  }
  int j = 1;
  for (int i = 1; i <= 10; i++) {
    print(def(i, j));
    j += 2;
  }
}
