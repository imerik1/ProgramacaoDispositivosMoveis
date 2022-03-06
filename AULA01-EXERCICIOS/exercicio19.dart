// Armazenar vinte valores em um vetor. Após a digitação, entrar com
//uma constante multiplicativa que deverá multiplicar cada um dos
//valores do vetor e armazenar o resultado no próprio vetor, na
//respectiva posição.

void main() {
  List<double> ns = [
    1,
    5,
    6,
    7,
    9,
    2,
    9,
    6,
    2,
    4,
    8,
    16,
    6,
    18,
    9,
    2,
    29,
    6,
    2,
    4
  ];
  double n = 2;
  ns.forEach((e) => print(e * n));
}
