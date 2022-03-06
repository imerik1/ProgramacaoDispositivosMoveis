// Armazenar dez valores na memória do computador. Após a digitação dos valores,
// criar uma rotina para ler os valores e achar e exibir o maior deles.

void main() {
  List<double> ns = [1, 5, 6, 7, 9, 2, 9, 6, 2, 4];
  double max = ns.reduce((value, element) => element > value ? element : value);
  print(max);
}
