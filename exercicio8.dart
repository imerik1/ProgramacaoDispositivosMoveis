// Entrar com o peso e a altura de uma determinada pessoa. Após a digitação,
// exibir se esta pessoa está ou não com seu peso ideal. Fórmula: peso/altura².

void main() {
  double peso = 80.0;
  double altura = 1.83;
  double imc = peso / (altura * altura);
  print('O seu IMC é $imc');
}
