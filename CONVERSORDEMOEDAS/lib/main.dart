import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conversor de Moedas',
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
  TextEditingController valorController = TextEditingController();

  List<String> currency = ["Real", "Euro", "Dólar"];
  String currencyActual = "Real";
  String currencyConvertedActual = "Dólar";
  String? convertedValue;
  var icons = {"Real": "R\$", "Euro": "€", "Dólar": "\$"};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Conversor de Moedas"),
        ),
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _padding(const Center(
                child: Text(
              "Conversor de moedas Dolar, Real e Euro",
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ))),
            _padding(TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Valor",
                  hintText: "Digite o valor"),
              controller: valorController,
              keyboardType: TextInputType.number,
            )),
            _padding(Row(
              children: [
                const Text("De"),
                const SizedBox(width: 10),
                DropdownButton(
                  value: currencyActual,
                  items: currency.map((String curr) {
                    return DropdownMenuItem(
                      value: curr,
                      child: Text(curr),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      currencyActual = newValue!;
                      if (convertedValue != null) {
                        _convert();
                      }
                    });
                  },
                ),
                const Spacer(flex: 1),
                const Text("Para"),
                const SizedBox(width: 10),
                DropdownButton(
                  value: currencyConvertedActual,
                  items: currency.map((String curr) {
                    return DropdownMenuItem(
                      value: curr,
                      child: Text(curr),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      currencyConvertedActual = newValue!;
                      if (convertedValue != null) {
                        _convert();
                      }
                    });
                  },
                )
              ],
            )),
            _padding(ElevatedButton(
              child: const Text("Converter"),
              onPressed: _convert,
            )),
            convertedValue != null
                ? _padding(Text(
                    "${icons[currencyConvertedActual]} ${convertedValue!}",
                    style: const TextStyle(fontSize: 22),
                  ))
                : const SizedBox(width: 0)
          ],
        )));
  }

  _convert() {
    setState(() {
      double value = double.parse(valorController.text);
      if (currencyActual == "Real") {
        if (currencyConvertedActual == "Euro") {
          convertedValue = (value / 5.16).toStringAsFixed(2);
        }
        if (currencyConvertedActual == "Dólar") {
          convertedValue = (value / 4.74).toStringAsFixed(2);
        }
      }
      if (currencyActual == "Euro") {
        if (currencyConvertedActual == "Real") {
          convertedValue = (value * 5.16).toStringAsFixed(2);
        }
        if (currencyConvertedActual == "Dólar") {
          convertedValue = (value * 1.09).toStringAsFixed(2);
        }
      }
      if (currencyActual == "Dólar") {
        if (currencyConvertedActual == "Euro") {
          convertedValue = (value / 1.09).toStringAsFixed(2);
        }
        if (currencyConvertedActual == "Real") {
          convertedValue = (value * 4.74).toStringAsFixed(2);
        }
      }
    });
  }

  _padding(Widget widget) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: widget,
    );
  }
}
