import 'package:flutter/material.dart';

class About extends StatefulWidget {
  final String name;
  final int age;
  final String gender;
  final String school;
  final double limit;
  final bool brazilian;

  const About(
      {Key? key,
      required this.name,
      required this.age,
      required this.gender,
      required this.school,
      required this.limit,
      required this.brazilian})
      : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _title("Confira seus dados"),
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(2, 20, 2, 20),
      child: Wrap(
        spacing: 20,
        runSpacing: 20,
        children: <Widget>[
          _showData("Nome", widget.name),
          _showData("Idade", widget.age),
          _showData("Sexo", widget.gender),
          _showData("Escolaridade", widget.school),
          _showData("Limite", widget.limit),
          _showData("Brasileiro", widget.brazilian ? "Sim" : "Não"),
        ],
      ),
    );
  }

  _title(String title) {
    return AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(title,
            style: const TextStyle(color: Colors.white, fontSize: 26)));
  }

  _showData(String title, dynamic value) {
    return Row(
      children: <Widget>[
        Text(
          '$title: ',
          style: const TextStyle(
              color: Colors.green, fontWeight: FontWeight.bold, fontSize: 22),
        ),
        Text(
          '$value',
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.normal, fontSize: 20),
        ),
      ],
    );
  }
}
