// Armazenar o nome e idade de 5 pessoas. Após a
//digitação, exibir os dados (nome e idade) de todas as pessoas.

import 'utils/validarInputNumber.dart';
import 'utils/validarInputString.dart';

class Pessoa {
  String nome;
  double idade;
  Pessoa(this.nome, this.idade) {}
}

void main() {
  final List<Pessoa> pessoas = List.generate(
      5,
      (index) => Pessoa(validarInputString("Digite seu nome", null),
          validarInputNumber("Digite sua idade", null)));
  pessoas.forEach((p) =>
      print('Nome: ${p.nome} e sua idade é ${p.idade.toStringAsPrecision(0)}'));
}
