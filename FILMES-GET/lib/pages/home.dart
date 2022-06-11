import 'package:flutter/material.dart';
import 'package:github/pages/movie.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> movies = [];

  @override
  void initState() {
    http
        .get(Uri.parse('https://sujeitoprogramador.com/r-api/?api=filmes'))
        .then((response) {
      setState(() {
        List body = json.decode(response.body);
        for (var movie in body) {
          movies.add(
              _detailMovie(movie['nome'], movie['foto'], movie['sinopse']));
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _title("Filmes"),
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
        children: movies,
      ),
    );
  }

  _detailMovie(String name, String url, String detail) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              name,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.black),
                child: const Text(
                  "Leia Mais",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) {
                      return Movie(
                        name: name,
                        detail: detail,
                      );
                    }),
                  );
                }),
          ],
        ),
        Image.network(
          url,
          width: 400,
        )
      ],
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
