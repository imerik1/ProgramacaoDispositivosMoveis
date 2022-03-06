// Armazenar o nome e idade de 5 pessoas. Após a
//digitação, exibir os dados (nome e idade) de todas as pessoas.

void main() {
  var person = [
    {"name": 'Erik', "age": 30},
    {"name": 'Maithe', "age": 20},
    {"name": 'João', "age": 19},
    {"name": 'Pedro', "age": 18},
    {"name": 'Vanessa', "age": 22},
  ];
  person.forEach((p) => print(p));
}
