import 'package:flutter/material.dart';
import 'dart:math';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String randomNumber = "Clique em descobrir";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _title("Jogo do número aleatório"),
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
          _image("https://cdn-icons-png.flaticon.com/512/5184/5184592.png"),
          const SizedBox(height: 40),
          _text("Número aleatório: $randomNumber"),
          const SizedBox(height: 40),
          _button("Descobrir", _discover),
        ],
      ),
    );
  }

  void _discover() {
    setState(() {
      randomNumber = Random().nextInt(100).toString();
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
