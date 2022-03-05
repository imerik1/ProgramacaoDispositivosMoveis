// Armazenar dez números na memória do computador.
//Exibir os valores na ordem inversa à da digitação.

void main() {
  List<double> ns = [1, 5, 6, 7, 9, 2, 9, 6, 2, 4];
  for (int i = ns.length - 1; i >= 0; i--) {
    print(ns[i]);
  }
}
