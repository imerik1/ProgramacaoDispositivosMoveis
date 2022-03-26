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
      resizeToAvoidBottomInset: false,
      appBar: _title("Alcool ou gasolina"),
      body: _body(),
    );
  }

  _title(String text) {
    return AppBar(
      title: Text(text),
      centerTitle: true,
      backgroundColor: Colors.red,
    );
  }

  _body() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 43.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _image("https://cdn-icons-png.flaticon.com/512/1986/1986894.png"),
          _field("Preço do alcool/L", n1Controller),
          _field("Preço da gasolina/L", n2Controller),
          _button("Verificar", _verify),
          _text(info)
        ],
      ),
    );
  }

  void _verify() {
    setState(() {
      double n1 = double.parse(n1Controller.text);
      double n2 = double.parse(n2Controller.text);
      double resultado = n1 / n2;

      if (resultado <= 1.7) {
        info = "O alcool é mais vantajoso.";
        return;
      }
      info = "A gasolina é mais vantajosa.";
    });
  }

  _image(String url) {
    return Center(
        child: Image.network(
      url,
      width: 100,
    ));
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
          style: ElevatedButton.styleFrom(primary: Colors.yellow),
          onPressed: onPressedFunction,
          child:
              Text(text, style: TextStyle(color: Colors.black, fontSize: 20.0)),
        ),
      ),
    );
  }
}
