import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      body: SingleChildScrollView(child: _body()),
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
          _button("Confirmar", _confirm),
          _text("Dados Informados"),
          _subText(n1Controller.text),
          _subText(n2Controller.text),
          _subText(dropdownGenderValue),
          _subText(dropdownSchoolValue),
          _subText(limit.toString()),
          _subText(brazilian ? "Brasileiro" : "Estrangeiro")
        ],
      ),
    );
  }

  void _confirm() {
    setState(() {});
  }

  _text(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.green, fontSize: 22),
    );
  }

  _subText(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.green, fontSize: 16),
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
