import 'package:flutter/material.dart';

class Experience extends StatefulWidget {
  const Experience({Key? key}) : super(key: key);

  @override
  _ExperienceState createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  _body() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(5, 20, 5, 20),
      child: Wrap(
        spacing: 20,
        runSpacing: 20,
        children: <Widget>[
          _primaryText("Atualmente trabalho na Mosaico, SIS e Código Fonte TV"),
          _cardDescription(
              "Mosaico", "Engenheiro de Software III", "04/2022", "presente"),
          _cardDescription(
              "SIS", "Analista de Sistemas Senior", "09/2021", "presente"),
          _cardDescription(
              "IBM", "Especialista de Sistemas", "04/2021", "09/2021"),
          _cardDescription("Código Fonte TV", "Programador Front-End Senior",
              "11/2020", "presente"),
        ],
      ),
    );
  }

  _cardDescription(
      String companyName, String jobTitle, String start, String end) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.green),
          borderRadius: BorderRadius.circular(10)),
      child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              _primaryText(companyName),
              _secondaryText(jobTitle),
              _thirdText("$start - $end")
            ],
          )),
    );
  }

  _primaryText(String text) {
    return Center(
        child: Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
          color: Colors.green, fontSize: 22, fontWeight: FontWeight.bold),
    ));
  }

  _secondaryText(String text) {
    return Center(
        child: Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
          color: Colors.black, fontSize: 16, fontWeight: FontWeight.normal),
    ));
  }

  _thirdText(String text) {
    return Center(
        child: Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
          color: Colors.black, fontSize: 12, fontWeight: FontWeight.normal),
    ));
  }
}
