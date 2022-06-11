import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool mode = false;
  bool fontSizeSmall = false;

  @override
  Widget build(BuildContext context) {
    setState(() {
      SharedPreferences.getInstance().then((prefs) {
        mode = prefs.getBool("mode") ?? mode;
        fontSizeSmall = prefs.getBool("fontSizeSmall") ?? fontSizeSmall;
      });
    });
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _title("Frases"),
      body: Container(
        constraints: const BoxConstraints.expand(),
        child: _body(),
        decoration: BoxDecoration(color: mode ? Colors.black : Colors.white),
      ),
    );
  }

  _body() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(2, 40, 2, 40),
      child: Wrap(
        spacing: 20,
        runSpacing: 20,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _switchMode(mode ? "Escuro" : "Claro"),
              _switchFontSize(fontSizeSmall ? "Pequeno" : "Grande")
            ],
          ),
          _bodyPhrases(
              "Seja estranho. Seja aleatório. Seja quem você é. Porque você nunca sabe quem amaria a pessoa que você esconde.")
        ],
      ),
    );
  }

  _switchMode(String text) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        text,
        style: TextStyle(
            color: Colors.green,
            fontSize: fontSizeSmall ? 14 : 20,
            fontWeight: FontWeight.bold),
      ),
      Switch(
        value: mode,
        onChanged: (value) {
          setState(() {
            SharedPreferences.getInstance()
                .then((prefs) => {prefs.setBool("mode", value)});
            mode = value;
          });
        },
        activeTrackColor: Colors.lightGreenAccent,
        activeColor: Colors.green,
      )
    ]);
  }

  _switchFontSize(String text) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        text,
        style: TextStyle(
            color: Colors.green,
            fontSize: fontSizeSmall ? 14 : 20,
            fontWeight: FontWeight.bold),
      ),
      Switch(
        value: fontSizeSmall,
        onChanged: (value) {
          setState(() {
            SharedPreferences.getInstance()
                .then((prefs) => {prefs.setBool("fontSizeSmall", value)});
            fontSizeSmall = value;
          });
        },
        activeTrackColor: Colors.lightGreenAccent,
        activeColor: Colors.green,
      )
    ]);
  }

  _bodyPhrases(String phrases) {
    return Center(
        child: Text(
      phrases,
      style: TextStyle(
          color: Colors.green,
          fontSize: fontSizeSmall ? 14 : 20,
          fontWeight: FontWeight.bold),
    ));
  }

  _title(String title) {
    return AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(title,
            style: const TextStyle(color: Colors.white, fontSize: 26)));
  }
}
