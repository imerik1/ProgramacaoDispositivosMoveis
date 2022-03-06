// Entrar via teclado com o valor da cotação do dólar e uma certa
//quantidade de dólares. Calcular e exibir o valor correspondente em Reais (R$).

import 'utils/validarInputNumber.dart';

void main() {
  double dolar = validarInputNumber("Digite o valor em reais", null);
  final double reais = dolar * 5.06;
  print('R\$ $reais');
}
