// Entrar com o peso, o sexo e a altura de uma determinada pessoa. Após a
//digitação, exibir se esta pessoa está ou não
//com seu peso ideal. Fórmula: peso/altura².

void main() {
  double peso = 80.0;
  double altura = 1.83;
  String sexo = "masculino";
  double imc = peso / (altura * altura);
  if (imc > 20 && imc < 24.9 && sexo == "Masculino") {
    return print('Seu IMC é ideal, o valor é $imc');
  }
  if (imc > 19 && imc < 23.9 && sexo == "Feminino") {
    return print('Seu IMC é ideal, o valor é $imc');
  }
  print('Seu IMC não é ideal, o valor é $imc');
}
