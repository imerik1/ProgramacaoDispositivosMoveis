// Exibir os trinta primeiros valores da série de Fibonacci.
//A série: 1, 1, 2, 3, 5, 8, ...

int fibo(int n) {
  return (n < 2) ? n : fibo(n - 1) + fibo(n - 2);
}

void main() {
  final double f = 30;
  for (int i = 0; i < f; i++) {
    print(fibo(i));
  }
}
