// A partir dos valores da aceleração (a em m/s2), da velocidade inicial
//(v0 em m/s) e do tempo de percurso
// (t em s). Calcular e exibir a velocidade final de automóvel em km/h.
//Exibir mensagem de acordo com a
// tabela:

void main() {
  double a = 20;
  double v0 = 10;
  double t = 60;
  double f = v0 + (a * t);
  print('A velocidade final é $f');
}
