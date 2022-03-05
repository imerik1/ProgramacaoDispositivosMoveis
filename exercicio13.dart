// Entrar via teclado com um valor (X) qualquer.
//Digitar o intervalo que o programa que deverá calcular a tabuada
//do valor X digitado, sendo que o segundo valor (B), deverá
//ser maior que o primeiro (A). Exibir a tabuada do valor digitado,
//no intervalo decrescente, ou seja, a tabuada de X no intervalo de B para A.

void main() {
  double x = 12.0;
  int f = 15;
  if (f < x) {
    return print(
        'O intervalo é inferior ao valor que deverá ser multiplicado.');
  }
  for (int i = 1; i <= f; i++) {
    double j = x * i;
    print('$x * $i = $j');
  }
}
