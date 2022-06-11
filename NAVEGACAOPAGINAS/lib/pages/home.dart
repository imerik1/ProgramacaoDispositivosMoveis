import 'package:flutter/material.dart';
import 'package:navegacao_paginas/pages/about.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController n1Controller = TextEditingController(text: "");
  TextEditingController n2Controller = TextEditingController(text: "18");
  String dropdownGenderValue = "Masculino";
  String dropdownSchoolValue = "Ensino fundamental";
  double limit = 100;
  bool brazilian = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _title("Abertura de conta"),
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(2, 20, 2, 20),
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        runAlignment: WrapAlignment.center,
        spacing: 20,
        runSpacing: 20,
        children: <Widget>[
          _field("Nome", n1Controller, TextInputType.name),
          _field("Idade", n2Controller, TextInputType.number),
          _dropdownGender(["Masculino", "Feminino"]),
          _dropdownSchool([
            "Não possui",
            "Ensino fundamental",
            "Ensino Médio",
            "Ensino superior"
          ]),
          _slider("Limite"),
          _switch("Brasileiro"),
          Center(
              child: _goTo(
            context,
            "Conferir dados",
            About(
                name: '${n1Controller.text}',
                age: int.parse('${n2Controller.text}'),
                gender: dropdownGenderValue,
                school: dropdownSchoolValue,
                limit: limit,
                brazilian: brazilian),
          ))
        ],
      ),
    );
  }

  _switch(String text) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        text,
        style: const TextStyle(color: Colors.green, fontSize: 20),
      ),
      Switch(
        value: brazilian,
        onChanged: (value) {
          setState(() {
            brazilian = value;
          });
        },
        activeTrackColor: Colors.lightGreenAccent,
        activeColor: Colors.green,
      )
    ]);
  }

  _dropdownGender(List<String> options) {
    return Center(
      child: SizedBox(
        width: 250,
        child: DropdownButton<String>(
          isExpanded: true,
          value: dropdownGenderValue,
          items: options.map((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value));
          }).toList(),
          onChanged: (String? selectedValue) {
            setState(() {
              dropdownGenderValue = selectedValue!;
            });
          },
        ),
      ),
    );
  }

  _dropdownSchool(List<String> options) {
    return SizedBox(
      width: 250,
      child: DropdownButton<String>(
        isExpanded: true,
        value: dropdownSchoolValue,
        items: options.map((String value) {
          return DropdownMenuItem<String>(value: value, child: Text(value));
        }).toList(),
        onChanged: (String? selectedValue) {
          setState(() {
            dropdownSchoolValue = selectedValue!;
          });
        },
      ),
    );
  }

  _slider(String text) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        text,
        style: const TextStyle(color: Colors.green, fontSize: 20),
      ),
      Slider(
        value: limit,
        onChanged: (double value) {
          setState(() {
            limit = value;
          });
        },
        min: 1,
        max: 100,
        divisions: 20,
        label: "${limit.toInt()}",
      )
    ]);
  }

  _field(String labelTitle, TextEditingController objController,
      TextInputType keyboardType) {
    return TextField(
      keyboardType: keyboardType,
      decoration: InputDecoration(
          labelText: labelTitle,
          labelStyle: const TextStyle(color: Colors.green)),
      textAlign: TextAlign.center,
      style: const TextStyle(color: Colors.green, fontSize: 25.0),
      controller: objController,
      onChanged: (String value) {
        setState(() {
          objController.text = value;
        });
      },
    );
  }

  _title(String title) {
    return AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(title,
            style: const TextStyle(color: Colors.white, fontSize: 26)));
  }

  _goTo(BuildContext context, String title, Widget page) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.green),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (BuildContext context) {
              return page;
            }),
          );
        });
  }
}
