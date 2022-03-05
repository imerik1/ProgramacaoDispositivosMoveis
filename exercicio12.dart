// Entrar via teclado com um valor qualquer. Após a digitação,
//exibir a tabuada do valor solicitado, no intervalo de um a dez.

void main() {
  double v = 9;
  for (int i = 1; i <= 10; i++) {
    double j = v * i;
    print('$v * $i = $j');
  }
}
