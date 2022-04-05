import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anuncios',
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Anuncios"),
        ),
        body: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            __containerPadding("Anuncio 1"),
            __containerPadding("Anuncio 2"),
            __containerPadding("Anuncio 3"),
            __containerPadding("Anuncio 4"),
            __containerPadding("Anuncio 5"),
            __containerPadding("Anuncio 6"),
            __containerPadding("Anuncio 7"),
            __containerPadding("Anuncio 8"),
            __containerPadding("Anuncio 9"),
          ],
        ));
  }

  __containerPadding(String description) {
    return Container(
      width: 200,
      height: 200,
      padding: const EdgeInsets.all(10.0),
      child: Center(
          child: Text(
        description,
        style: const TextStyle(color: Colors.red, fontSize: 20),
      )),
    );
  }
}
