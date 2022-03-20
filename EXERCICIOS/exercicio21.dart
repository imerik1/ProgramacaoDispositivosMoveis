// Armazenar o nome, sexo e idade de 5 pessoas. As entradas
//devem ser apenas “F” ou “M” para o sexo e valores positivos
//para a idade. Após a digitação dos dados, exibir os dados
//(nome, sexo e idade) de todas as pessoas do sexo feminino.

import 'utils/validarInputNumber.dart';
import 'utils/validarInputString.dart';

String validarSexo() {
  String sexo =
      validarInputString("Digite seu sexo (F ou M)", "").toUpperCase();
  while (0 == 0) {
    if (sexo != "M" || sexo != "F") {
      validarSexo();
    }
    break;
  }
  return sexo;
}

class Pessoa {
  String nome;
  double idade;
  String sexo;
  Pessoa(this.nome, this.idade, this.sexo) {}
}

void main() {
  final List<Pessoa> pessoas = List.generate(
      5,
      (index) => Pessoa(validarInputString("Digite seu nome", null),
          validarInputNumber("Digite sua idade", null), validarSexo()));
  pessoas.forEach((p) =>
      print('Nome: ${p.nome} e sua idade é ${p.idade.toStringAsPrecision(0)}'));
}
