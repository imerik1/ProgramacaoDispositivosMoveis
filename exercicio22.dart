// Criar um mini sistema bancário com as classes: Conta, Conta Corrente,
//Conta Poupança e Cliente. Cada classe deve ter atributos específicos.
//No sistema devemos ter pelo menos 3 funcionalidades: Saque, Depósito e
// Transferência.
import 'dart:io';

/**
 * Requisitos
 * 1- Criar conta
 * 2- Entrar na conta
 * 3- Depositar
 * 4- Sacar
 * 5- Transferir
 * 6- Criar conta oposta
 * 7- Investir
 * 8- Resgatar
 * 9- Extrato
 */

// CRIA ALGUMAS CONTA PARA EU TESTAR
void popularBanco(Banco banco) {
  Iterable<Cliente> clientes = [
    Cliente("Jorge", "200", "fff", null, null),
    Cliente("Adriano", "201", "fff", null, null),
    Cliente("Carlos", "202", "fff", null, null),
    Cliente("Maithê", "203", "jjj", null, null),
    Cliente("Erik", "204", "ddd", null, null),
    Cliente("João", "205", "fff", null, null),
    Cliente("Luiz", "206", "ccc", null, null),
    Cliente("Pedro", "207", "aaa", null, null),
    Cliente("Larissa", "208", "hhh", null, null),
    Cliente("Felipe", "209", "ggg", null, null),
  ];
  int i = 0;
  clientes.forEach((cliente) {
    if (i % 2 == 0) {
      cliente.corrente = Corrente(banco.pegarNumeroConta(), cliente);
    } else {
      cliente.poupanca = Poupanca(banco.pegarNumeroConta(), cliente);
    }
    banco.clientes.add(cliente);
    i++;
  });
}

bool validar(String? valor) {
  if (valor == null || valor.length <= 0) {
    return false;
  }
  return true;
}

class Conta {
  Cliente? cliente;
  double saldo = 0;
  final String agencia = "32";
  final String conta;
  final String tipo;
  final List<Transacao> transacoes = [];
  Conta(this.cliente, this.conta, this.tipo) {}
  void mostrarExtrato() {
    if (transacoes.isEmpty) return print('Você não possui nenhuma transação.');
    print('=== EXTRATO ===');
    print('\n');
    print('COD \tCONTA   \tVALOR');
    transacoes.forEach(
        (transacao) => print('${transacao.nome} \tR\$${transacao.valor}'));
    print('SALDO ATUAL   \t\tR\$${saldo}');
    print('\n');
    print('=== FIM EXTRATO ===');
  }
}

class Transacao {
  final String nome;
  final String valor;
  Transacao(this.nome, this.valor) {}
}

class Corrente extends Conta {
  Corrente(String conta, Cliente? cliente)
      : super(cliente, conta, "Conta-Corrente") {}

  void depositar() {
    print('Coloque o valor desejado. (centavos dividido por ponto).');
    String valor = stdin.readLineSync() ?? "";
    if (!validar(valor)) return depositar();
    double v = double.tryParse(valor) ?? -1;
    if (v < 0.01) return depositar();
    saldo += v;
    print('Depósito realizado com sucesso.');
    transacoes.add(Transacao("DEP CONTA-CORRENTE", '$v +'));
  }

  void sacar() {
    print('Coloque o valor desejado. (centavos dividido por ponto).');
    String valor = stdin.readLineSync() ?? "";
    if (!validar(valor)) return sacar();
    double v = double.tryParse(valor) ?? -1;
    if (v < 0.01) return sacar();
    if (v > saldo) return print('Você não possui saldo suficiente.');
    saldo -= v;
    print('Saque realizado com sucesso.');
    transacoes.add(Transacao("SAQ CONTA-CORRENTE", '$v -'));
  }

  void transferir(Banco banco) {
    String cpf = banco.pegarCPFCliente();
    Iterable<Cliente> cs = banco.buscarCliente(cpf, null);
    if (cs.isEmpty) {
      return print('Você ainda não possui uma conta');
    }
    Cliente c = cs.first;
    print('Coloque o valor desejado. (centavos dividido por ponto).');
    String valor = stdin.readLineSync() ?? "";
    if (!validar(valor)) return transferir(banco);
    double v = double.tryParse(valor) ?? -1;
    if (v < 0.01) return transferir(banco);
    if (v > saldo) return print('Você não possui saldo suficiente.');
    if (c.corrente == null) return print('A pessoa não é correntista.');
    saldo -= v;
    c.corrente!.saldo += v;
    print('Tranferência realizada com sucesso.');
    transacoes.add(Transacao("TRN ${c.nome} C/C ${c.corrente?.conta}", '$v -'));
    c.corrente?.transacoes
        .add(Transacao("TRN ${cliente?.nome} C/C ${conta}", '$v +'));
  }

  void mostrarOpcoes(Banco banco) {
    bool sair = false;
    while (sair == false) {
      print('=== BEM VINDO A SUA CONTA-CORRENTE ===');
      print('Saldo disponível: R\$ $saldo');
      print('1- Sacar');
      print('2- Depositar');
      print('3- Transferencia');
      print('4- Extrato');
      print('5- Sair');
      print('Digite uma das opções existentes:');
      String opcao = stdin.readLineSync() ?? "";
      print('\n');
      if (!validar(opcao)) continue;
      switch (opcao) {
        case '1':
          {
            sacar();
            print('\n');
            break;
          }
        case '2':
          {
            depositar();
            print('\n');
            break;
          }
        case '3':
          {
            transferir(banco);
            print('\n');
            break;
          }
        case '4':
          {
            mostrarExtrato();
            print('\n');
            break;
          }
        case '5':
          {
            print('Saindo da conta-corrente...\n');
            sair = true;
            break;
          }
        default:
          {
            continue;
          }
      }
    }
  }
}

class Poupanca extends Conta {
  Poupanca(String conta, Cliente? cliente)
      : super(cliente, conta, "Conta-Poupança") {}

  void resgatar() {
    print('Coloque o valor desejado. (centavos dividido por ponto).');
    String valor = stdin.readLineSync() ?? "";
    if (!validar(valor)) return resgatar();
    double v = double.tryParse(valor) ?? -1;
    if (v < 0.01) return resgatar();
    if (v > saldo) return print('Você não possui saldo suficiente.');
    saldo -= v;
    print('Resgatado com sucesso.');
    transacoes.add(Transacao("RGT CONTA-POUPANÇA", '$v -'));
  }

  void investir() {
    print('Coloque o valor desejado. (centavos dividido por ponto).');
    String valor = stdin.readLineSync() ?? "";
    if (!validar(valor)) return investir();
    double v = double.tryParse(valor) ?? -1;
    if (v < 0.01) return investir();
    saldo += v;
    print('Investimento realizado com sucesso.');
    transacoes.add(Transacao("INVT CONTA-POUPANÇA", '$v +'));
  }

  void mostrarOpcoes(Banco banco) {
    bool sair = false;
    while (sair == false) {
      print('=== BEM VINDO A SUA CONTA-POUPANÇA ===');
      print('Total investimento: R\$ $saldo');
      print('1- Resgatar');
      print('2- Investir');
      print('3- Investir');
      print('4- Sair');
      print('Digite uma das opções existentes:');
      String opcao = stdin.readLineSync() ?? "";
      print('\n');
      if (!validar(opcao)) continue;
      switch (opcao) {
        case '1':
          {
            resgatar();
            print('\n');
            break;
          }
        case '2':
          {
            investir();
            print('\n');
            break;
          }
        case '3':
          {
            mostrarExtrato();
            print('\n');
            break;
          }
        case '4':
          {
            print('Saindo da conta-poupança...\n');
            sair = true;
            break;
          }
        default:
          {
            continue;
          }
      }
    }
  }
}

class Cliente {
  final String nome;
  final String cpf;
  String senha;
  Corrente? corrente;
  Poupanca? poupanca;
  Cliente(this.nome, this.cpf, this.senha, this.corrente, this.poupanca) {}
}

class Banco {
  final String nome = "EkerBank";
  final String cidade = "Praia Grande/SP";
  final List<Cliente> clientes = [];

  String pegarNomeCliente() {
    print('Digite seu nome:');
    String nome = stdin.readLineSync() ?? "";
    if (!validar(nome)) return pegarNomeCliente();
    return nome;
  }

  String pegarCPFCliente() {
    print('Digite seu CPF:');
    String cpf = stdin.readLineSync() ?? "";
    if (!validar(cpf)) return pegarCPFCliente();
    if (double.tryParse(cpf) == null) {
      print('Por favor, utilize números para essa operação.\n');
      return pegarCPFCliente();
    }
    return cpf;
  }

  String pegarNumeroConta() {
    int tamanho = clientes.length + 1;
    if (tamanho < 10) {
      return '000$tamanho';
    } else if (tamanho < 100) {
      return '00$tamanho';
    } else if (tamanho < 1000) {
      return '0$tamanho';
    }
    return '$tamanho';
  }

  String pegarSenhaConta() {
    print('Digite a sua senha:');
    String senha = stdin.readLineSync() ?? "";
    if (!validar(senha)) return pegarSenhaConta();
    return senha;
  }

  Iterable<Cliente> buscarCliente(String cpf, String? senha) {
    Iterable<Cliente> cs = clientes.where((cliente) {
      if (senha == null) return cliente.cpf == cpf;
      return cliente.cpf == cpf && cliente.senha == senha;
    });
    return cs;
  }

  Cliente criarContaCorrente(Cliente cliente, String conta) {
    Corrente corrente = Corrente(conta, cliente);
    cliente.corrente = corrente;
    print('Sua conta-corrente foi criada com sucesso');
    return cliente;
  }

  Cliente criarContaPoupanca(Cliente cliente, String conta) {
    Poupanca poupanca = Poupanca(conta, cliente);
    cliente.poupanca = poupanca;
    print('Sua conta-poupança foi criada com sucesso');
    return cliente;
  }

  void criarConta(String nome, String cpf) {
    String conta = pegarNumeroConta();
    String senha = pegarSenhaConta();
    Cliente cliente = Cliente(nome, cpf, senha, null, null);
    print('Você deseja abrir qual tipo de conta?');
    print('1- Conta Corrente');
    print('2- Conta Poupança');
    String opcao = stdin.readLineSync() ?? "";
    if (!validar(opcao)) return criarConta(nome, cpf);
    switch (opcao) {
      case '1':
        {
          criarContaCorrente(cliente, conta);
          break;
        }
      case '2':
        {
          criarContaPoupanca(cliente, conta);
          break;
        }
      default:
        {
          criarConta(nome, cpf);
        }
    }
    clientes.add(cliente);
    print('\n');
    print('Nome: ${cliente.nome}');
    print('CPF: ${cliente.cpf}');
    print('Agencia: 32');
    print('Conta: $conta');
    print('Sua senha é $senha');
  }

  void entrarNaConta() {
    String cpf = pegarCPFCliente();
    String senha = pegarSenhaConta();
    print('\n');
    Iterable<Cliente> cs = buscarCliente(cpf, senha);
    if (cs.isEmpty) {
      return print('Você ainda não possui uma conta');
    }
    bool sair = false;
    Cliente c = cs.first;
    var conta = c.corrente == null ? c.poupanca : c.corrente;
    while (sair == false) {
      print('=== BEM VINDO A SUA CONTA ${c.nome} ===');
      print('1- Meus dados');
      print('2- Conta-Corrente');
      print('3- Conta-Poupança');
      print('4- Sair');
      print('Digite uma das opções existentes:');
      String opcao = stdin.readLineSync() ?? "";
      print('\n');
      if (!validar(opcao)) continue;
      switch (opcao) {
        case '1':
          {
            print('Nome: ${c.nome}');
            print('CPF: ${c.cpf}');
            print('Senha: ${c.senha}');
            print('Agencia: ${conta?.agencia}');
            print('Conta: ${conta?.conta}');
            print('\n');
            break;
          }
        case '2':
          {
            if (c.corrente == null) {
              print('Você não possui conta-corrente.');
              print('Você desejar abrir uma conta-corrente?');
              print('1- Sim');
              print('2- Não');
              String opcao = stdin.readLineSync() ?? "";
              print('\n');
              switch (opcao) {
                case '1':
                  {
                    criarContaCorrente(c, conta!.conta);
                    print('\n');
                    break;
                  }
                default:
                  {
                    break;
                  }
              }
              break;
            }
            c.corrente!.mostrarOpcoes(this);
            print('\n');
            break;
          }
        case '3':
          {
            if (c.poupanca == null) {
              print('Você não possui conta-poupança.');
              print('Você desejar abrir uma conta-poupança?');
              print('1- Sim');
              print('2- Não');
              String opcao = stdin.readLineSync() ?? "";
              print('\n');
              switch (opcao) {
                case '1':
                  {
                    criarContaPoupanca(c, conta!.conta);
                    print('\n');
                    break;
                  }
                default:
                  {
                    break;
                  }
              }
              break;
            }
            c.poupanca!.mostrarOpcoes(this);
            print('\n');
            break;
          }
        case '4':
          {
            print('Saindo da conta...\n');
            sair = true;
            break;
          }
        default:
          {
            continue;
          }
      }
    }
  }

  void abrirConta() {
    String nome = pegarNomeCliente();
    String cpf = pegarCPFCliente();
    Iterable<Cliente> cs = buscarCliente(cpf, null);
    if (cs.isNotEmpty) {
      return print('Conta existente com seu CPF digitado acima.');
    }
    criarConta(nome, cpf);
  }
}

void main() {
  bool sair = false;
  Banco banco = Banco();
  popularBanco(banco);
  while (sair == false) {
    print(
        '=== BEM VINDO AO BANCO ${banco.nome} - ${banco.cidade} - Agencia 32 ===');
    print('1- Abrir conta');
    print('2- Entrar na conta');
    print('3- Conhecer mais do nosso banco');
    print('4- Sair');
    print('Digite uma das opções existentes:');
    String opcao = stdin.readLineSync() ?? "";
    print('\n');
    if (!validar(opcao)) continue;
    switch (opcao) {
      case '1':
        {
          print('Obrigado por escolher nossos serviços ^^');
          print('Vou precisar de alguns dados para criar uma conta para você');
          banco.abrirConta();
          print('\n');
          break;
        }
      case '2':
        {
          print('Olá, obrigado por voltar!');
          banco.entrarNaConta();
          print('\n');
          break;
        }
      case '3':
        {
          print(
              'Somos o banco Bradtausanta sediado em Praia Grande/SP, fundado por Erik Santana, seu intuito foi inovar o sistema bancário! Atualmente contamos com mais de ${banco.clientes.length} clientes e atuamos com contas correntes e poupaças.\n');
          print('\n');
          break;
        }
      case '4':
        {
          print('Foi um prazer atender você! Saindo...\n');
          sair = true;
          break;
        }
      default:
        {
          continue;
        }
    }
  }
}
