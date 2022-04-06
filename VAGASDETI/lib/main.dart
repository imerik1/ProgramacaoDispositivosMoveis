import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vagas de TI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> vagas = List.generate(4, (index) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: const [
          Center(
            child: Text(
              "BackEnd Engineer",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
          ),
          Center(
              child: Text(
            "Salário: R\$ 4.100,00",
            style: TextStyle(fontSize: 22),
          )),
          Center(
              child: Text(
            "Descrição: CRUD basicão já é senior",
            style: TextStyle(fontSize: 22),
          )),
          Center(
            child: Text(
              "Contato: 8902-4922",
              style: TextStyle(fontSize: 22),
            ),
          )
        ],
      ),
    );
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Vagas de TI"),
        ),
        body: SingleChildScrollView(child: _body()));
  }

  _body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: vagas,
    );
  }
}
