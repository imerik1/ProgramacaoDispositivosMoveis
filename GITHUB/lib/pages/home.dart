import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController usernameController = TextEditingController(text: "");
  String urlPhoto =
      "https://assets.ifttt.com/images/channels/2107379463/icons/monochrome_large.png";
  dynamic dataUsername;

  _getUser() async {
    http.Response response = await http.get(
        Uri.parse('https://api.github.com/users/${usernameController.text}'));
    setState(() {
      if (response.statusCode != 200) return;
      dataUsername = json.decode(response.body);
      urlPhoto = dataUsername['avatar_url'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _title("Github"),
      body: Container(
        child: _body(),
        decoration: const BoxDecoration(color: Colors.black),
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
          Center(
            child: Image.network(
              urlPhoto,
              height: 100,
            ),
          ),
          _field("Nome de usuário", usernameController, TextInputType.name),
          Center(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.white),
                child: const Text(
                  "Pesquisar",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                onPressed: () {
                  _getUser();
                }),
          ),
          dataUsername != null
              ? Column(
                  children: [
                    _textWithValue("Id", dataUsername['id']),
                    _textWithValue("Nome", dataUsername['login']),
                    _textWithValue(
                        "Repositórios", dataUsername['public_repos']),
                    _textWithValue("Criado em", dataUsername['created_at']),
                    _textWithValue("Seguidores", dataUsername['followers']),
                    _textWithValue("Seguindo", dataUsername['following']),
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
              color: Colors.white,
            )),
        Text('$value',
            style: const TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 22,
              color: Colors.white,
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
          labelStyle: const TextStyle(color: Colors.white)),
      textAlign: TextAlign.center,
      style: const TextStyle(color: Colors.white, fontSize: 25.0),
      controller: objController,
    );
  }

  _title(String title) {
    return AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(title,
            style: const TextStyle(color: Colors.black, fontSize: 26)));
  }
}
