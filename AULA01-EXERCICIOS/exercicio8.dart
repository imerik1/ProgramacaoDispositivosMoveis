// Entrar com o peso e a altura de uma determinada pessoa. Após a digitação,
// exibir se esta pessoa está ou não com seu peso ideal. Fórmula: peso/altura².

void main() {
  double peso = 80.0;
  double altura = 1.83;
  double imc = peso / (altura * altura);
  if (imc > 18.6 && imc < 24.9) {
    return print('Seu IMC é ideal, o valor é $imc');
  }
  print('Seu IMC não é ideal, o valor é $imc');
}
