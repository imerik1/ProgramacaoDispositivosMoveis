// Entrar via teclado com o valor de cinco produtos.
//Após as entradas, digitar um valor referente ao
// pagamento da somatória destes valores. Calcular e
//exibir o troco que deverá ser devolvido.

import 'utils/validarInputNumber.dart';

void main() {
  final List<double> produtos = List.generate(
      5, (int index) => validarInputNumber("Digite o valor do produto", null));
  final double valor = produtos.reduce((value, element) => value + element);
  final double pagamento =
      validarInputNumber("Digite o valor que vai pagar", null) - valor;
  if (pagamento < 0) {
    return print('O comprador não pagou o valor inteiro.');
  }
  print('O troco é de R\$ $pagamento');
}
