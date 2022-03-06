// A partir dos valores da aceleração (a em m/s2), da velocidade inicial
//(v0 em m/s) e do tempo de percurso
// (t em s). Calcular e exibir a velocidade final de automóvel em km/h.
//Exibir mensagem de acordo com a
// tabela:

import 'utils/validarInputNumber.dart';

void main() {
  final double a = validarInputNumber("Digite a aceleração", null);
  final double v0 = validarInputNumber("Digite a velocidade inicial", null);
  final double t = validarInputNumber("Digite o tempo de percurso", null);
  final double f = v0 + (a * t);
  print('A velocidade final é de ${f}km/h');
}
