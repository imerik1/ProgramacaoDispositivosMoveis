import 'package:flutter/material.dart';

class Movie extends StatefulWidget {
  final String name;
  final String detail;
  const Movie({Key key, this.name, this.detail}) : super(key: key);

  @override
  _MovieState createState() => _MovieState();
}

class _MovieState extends State<Movie> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _title(widget.name),
      body: _body(),
    );
  }

  _body() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(2, 20, 2, 20),
      child: Wrap(
        spacing: 20,
        runSpacing: 20,
        children: <Widget>[
          Text(
            widget.detail,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
                color: Colors.black),
          )
        ],
      ),
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
