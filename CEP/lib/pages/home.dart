import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController cepController = TextEditingController(text: "");
  dynamic dataCep;

  _getUser() async {
    http.Response response = await http
        .get(Uri.parse('https://viacep.com.br/ws/${cepController.text}/json'));
    setState(() {
      if (response.statusCode != 200) return;
      dataCep = json.decode(response.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _title("CEP x Endereço"),
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
          _field("Digite seu cep", cepController, TextInputType.number),
          Center(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.black),
                child: const Text(
                  "Pesquisar",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                onPressed: () {
                  _getUser();
                }),
          ),
          dataCep != null && dataCep['logradouro'] != ""
              ? Column(
                  children: [
                    _textWithValue("CEP", cepController.text),
                    _textWithValue("Logradouro", dataCep['logradouro']),
                    _textWithValue("Bairro", dataCep['bairro']),
                    _textWithValue("Cidade", dataCep['localidade']),
                    _textWithValue("Estado", dataCep['uf']),
                  ],
                )
              : Row()
        ],
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

  _title(String title) {
    return AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(title,
            style: const TextStyle(color: Colors.white, fontSize: 26)));
  }
}
