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
	if(f <= 40) return print("Velocidade muito lento.");
	if(f >= 40 && f <= 60) return print("Velocidade permitida.");
	if(f >= 60 && f <= 80) return print("Velocidade de cruzeiro.");
	if(f >= 80 && f <= 120) return print("Velocidade rápido.");
	if(f > 120) return print("Velocidade muito rápido.");
}
