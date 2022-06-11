import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController valueController = TextEditingController(text: "");
  String from = "USD";
  String to = "BRL";
  List<String> currencys = ["BRL", "USD", "BTC", "EUR"];
  String valueConverter = "";

  _converter() async {
    http.Response response = await http.get(
        Uri.parse('https://economia.awesomeapi.com.br/json/last/$from-$to'));
    setState(() {
      if (to == from) {
        valueConverter = valueController.text;
        return;
      }
      if (response.statusCode != 200) return;
      var body = json.decode(response.body);
      double ask = double.tryParse(body['$from$to']['ask']);
      double value = double.parse(valueController.text);
      valueConverter = '${value * ask}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _title("Conversor de Moedas"),
      body: Container(
        child: _body(),
        decoration: const BoxDecoration(color: Colors.white),
        constraints: const BoxConstraints.expand(),
      ),
    );
  }

  _body() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(2, 20, 2, 20),
      child: Wrap(
        spacing: 20,
        runSpacing: 20,
        children: <Widget>[
          _field("Digite o valor a converter", valueController,
              TextInputType.number),
          _dropdownTo(),
          _dropdownFrom(),
          Center(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.black),
                child: const Text(
                  "Converter",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                onPressed: () {
                  _converter();
                }),
          ),
          Center(
              child: Text('$from $valueConverter',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.black,
                  ))),
        ],
      ),
    );
  }

  _field(String labelTitle, TextEditingController objController,
      TextInputType keyboardType) {
    return TextField(
      keyboardType: keyboardType,
      decoration: InputDecoration(
          labelText: labelTitle,
          labelStyle: const TextStyle(color: Colors.black)),
      textAlign: TextAlign.center,
      style: const TextStyle(color: Colors.black, fontSize: 25.0),
      controller: objController,
    );
  }

  _dropdownFrom() {
    return Center(
      child: SizedBox(
        width: 250,
        child: DropdownButton<String>(
          isExpanded: true,
          value: from,
          items: currencys.map((String value) {
            return DropdownMenuItem<String>(
                value: value,
                child: Text(value,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.black,
                    )));
          }).toList(),
          onChanged: (String selectedValue) {
            setState(() {
              from = selectedValue;
              _converter();
            });
          },
        ),
      ),
    );
  }

  _dropdownTo() {
    return Center(
      child: SizedBox(
        width: 250,
        child: DropdownButton<String>(
          isExpanded: true,
          value: to,
          items: currencys.map((String value) {
            return DropdownMenuItem<String>(
                value: value,
                child: Text(value,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.black,
                    )));
          }).toList(),
          onChanged: (String selectedValue) {
            setState(() {
              to = selectedValue;
              _converter();
            });
          },
        ),
      ),
    );
  }

  _textWithValue(String title, dynamic value) {
    return Row(
      children: <Widget>[
        Text('$title: ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Colors.black,
            )),
        Text('$value',
            maxLines: 2,
            softWrap: true,
            overflow: TextOverflow.fade,
            style: const TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 22,
              color: Colors.black,
            ))
      ],
    );
  }

  _title(String title) {
    return AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(title,
            style: const TextStyle(color: Colors.white, fontSize: 26)));
  }
}
