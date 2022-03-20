import 'package:flutter/material.dart';

class WidgetHome extends StatefulWidget {
  const WidgetHome({Key? key}) : super(key: key);

  @override
  __HomeState createState() => __HomeState();
}

class __HomeState extends State<WidgetHome> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        appBar: AppBar(
          title: const Text("Contador de pessoas"),
          centerTitle: true,
        ),
        body: _body()));
  }

  _body() {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _primaryText("Contador de pessoas"),
              _secondaryText("$_counter"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  __button("+", _increment),
                  __button("-", _decrement),
                ],
              )
            ]),
      ),
    );
  }

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  void _decrement() {
    setState(() {
      if (_counter == 0) return;
      _counter--;
    });
  }

  __button(String text, Function() onPressedFunction) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: SizedBox(
        height: 50.0,
        child: ElevatedButton(
          onPressed: onPressedFunction,
          child: _secondaryText(text),
        ),
      ),
    );
  }

  _primaryText(String text) {
    return Text(text,
        style: const TextStyle(
            fontSize: 30, color: Colors.blue, fontWeight: FontWeight.bold));
  }

  _secondaryText(String text) {
    return Text(text,
        style: const TextStyle(
            fontSize: 28, color: Colors.red, fontWeight: FontWeight.bold));
  }
}
