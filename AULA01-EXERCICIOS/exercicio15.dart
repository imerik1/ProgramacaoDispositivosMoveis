// Exibir os vinte primeiros valores da série de
//Bergamaschi. A série: 1, 1, 1, 3, 5, 9, 17, ...

int berg(int n) {
  return (n <= 3) ? 1 : berg(n - 1) + berg(n - 2) + berg(n - 3);
}

void main() {
  final double f = 20;
  for (int i = 1; i <= f; i++) {
    print(berg(i));
  }
}
