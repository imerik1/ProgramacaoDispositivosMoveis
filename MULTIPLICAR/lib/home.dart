import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController n1Controller = TextEditingController();
  TextEditingController n2Controller = TextEditingController();

  String info = "Informe os números!";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _title("Multiplicador de números"),
      body: _body(),
    );
  }

  _title(String text) {
    return AppBar(
      title: Text(text),
      centerTitle: true,
      backgroundColor: Colors.green,
    );
  }

  _body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _field("Digite o 1° número", n1Controller),
        _field("Digite o 2° número", n2Controller),
        _button("Multiplicar", _multiply),
        _text(info)
      ],
    );
  }

  void _multiply() {
    setState(() {
      double n1 = double.parse(n1Controller.text);
      double n2 = double.parse(n2Controller.text);
      double resultado = n1 * n2;

      info = "Resultado $resultado";
    });
  }

  _text(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.green, fontSize: 20),
    );
  }

  _field(String labelTitle, TextEditingController objController) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: labelTitle,
          labelStyle: const TextStyle(color: Colors.green)),
      textAlign: TextAlign.center,
      style: const TextStyle(color: Colors.green, fontSize: 25.0),
      controller: objController,
    );
  }

  _button(String text, Function() onPressedFunction) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: SizedBox(
        height: 50.0,
        child: ElevatedButton(
          onPressed: onPressedFunction,
          child: const Text("Calcular",
              style: TextStyle(color: Colors.white, fontSize: 20.0)),
        ),
      ),
    );
  }
}
