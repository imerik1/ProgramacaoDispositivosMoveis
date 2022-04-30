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
  String linkPhoto =
      "https://media-exp1.licdn.com/dms/image/C4E03AQF0BCgFgsykEA/profile-displayphoto-shrink_800_800/0/1634870782472?e=1656547200&v=beta&t=EoL28wvjAMso3fqy60eXonbzeEJmBQqi_0xiWC_ju5o";
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
      drawer: _drawer(),
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

  _listTile(int index, String title, IconData icon) {
    return ListTile(
      title: Text(title),
      trailing: Icon(
        icon,
        color: Colors.black,
      ),
      selected: _pageIndex == index,
      onTap: () {
        setState(() {
          _pageIndex = index;
        });
      },
    );
  }

  _drawer() {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: ClipRRect(
                child: Image.network(linkPhoto),
                borderRadius: BorderRadius.circular(100)),
            accountName: Row(children: const [
              Icon(
                Icons.assignment_ind_sharp,
                color: Colors.white,
              ),
              Text("Erik Santana")
            ]),
            accountEmail: Row(children: const [
              Icon(
                Icons.email,
                color: Colors.white,
              ),
              Text("santanaerik1106@gmail.com")
            ]),
          ),
          _listTile(0, "Pessoal", Icons.assignment_ind_sharp),
          _listTile(1, "Formação", Icons.book),
          _listTile(2, "Experiência", Icons.work)
        ],
      ),
    );
  }
}
