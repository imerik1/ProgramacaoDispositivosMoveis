// Entrar via teclado com o valor de cinco produtos.
//Após as entradas, digitar um valor referente ao
// pagamento da somatória destes valores. Calcular e
//exibir o troco que deverá ser devolvido.

void main() {
  List<double> produtos = [2.0, 3.0, 15.0, 6.0, 8.0];
  double valor = produtos.reduce((value, element) => value + element);
  double pagamento = 47.00 - valor;
  if (pagamento < 0) {
    return print('O comprador não pagou o valor inteiro.');
  }
  print('O troco é de $pagamento');
}
