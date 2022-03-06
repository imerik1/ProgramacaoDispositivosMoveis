// Armazenar o nome, sexo e idade de 5 pessoas. As entradas
//devem ser apenas “F” ou “M” para o sexo e valores positivos
//para a idade. Após a digitação dos dados, exibir os dados
//(nome, sexo e idade) de todas as pessoas do sexo feminino.

void main() {
  var person = [
    {"name": 'Erik', "age": 30, "sexo": "M"},
    {"name": 'Maithe', "age": 20, "sexo": "F"},
    {"name": 'João', "age": 19, "sexo": "M"},
    {"name": 'Pedro', "age": 18, "sexo": "M"},
    {"name": 'Vanessa', "age": 22, "sexo": "F"},
  ];
  person.forEach((p) => print(p));
}
