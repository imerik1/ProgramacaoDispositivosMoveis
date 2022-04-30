import 'package:flutter/material.dart';
import 'experience.dart';
import 'education.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class Page {
  String title;
  dynamic body;
  Page(this.title, this.body);
}

class _HomeState extends State<Home> {
  int _pageIndex = 0;
  List<Page> pages = [
    Page("Página Inicial", null),
    Page("Formação", const Education()),
    Page("Experiência", const Experience())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(pages[_pageIndex].title),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: _pageIndex == 0 ? _body() : pages[_pageIndex].body,
      bottomNavigationBar: _bottom(),
    );
  }

  _body() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(5, 20, 5, 20),
      child: Wrap(
        spacing: 20,
        runSpacing: 20,
        children: <Widget>[
          _primaryText("Olá, meu nome é Erik, tenho 20 anos!"),
          _secondaryText("Github: imerik1"),
          _secondaryText("Linkedin: imerik1")
        ],
      ),
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

  _bottom() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            label: "Pessoal", icon: Icon(Icons.assignment_ind_sharp)),
        BottomNavigationBarItem(label: "Formação", icon: Icon(Icons.book)),
        BottomNavigationBarItem(label: "Experiência", icon: Icon(Icons.work)),
      ],
      currentIndex: _pageIndex,
      selectedItemColor: Colors.green,
      onTap: (int index) {
        setState(() {
          _pageIndex = index;
        });
      },
    );
  }
}
