// Calcular e exibir a área de um retângulo, a partir dos valores da
// base e altura que serão digitados. Se a área for maior que 100,
//exibir a mensagem “Terreno grande”, caso contrário,
//exibir a mensagem “Terreno pequeno”.

void main() {
  double base = 5.0;
  double altura = 2.0;
  double area = (base * altura) / 2;
  if (area > 100) {
    return print('Terreno grande');
  }
  print('Terreno pequeno');
}
