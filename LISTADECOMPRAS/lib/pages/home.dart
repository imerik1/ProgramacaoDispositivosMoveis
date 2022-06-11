import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List shops = [];
  late Database db;
  final TextEditingController _itemController = TextEditingController();

  _recoverDb() async {
    final pathDb = await getDatabasesPath();
    final pathMobile = join(pathDb, "banco.db");

    final db = await openDatabase(pathMobile, version: 1,
        onCreate: (db, dbVersaoRecente) {
      String sql =
          "CREATE TABLE SHOPS(id INTEGER PRIMARY KEY AUTOINCREMENT, item VARCHAR)";
      db.execute(sql);
    });
    print(await db.rawQuery("SELECT * FROM SHOPS"));
    setState(() {
      this.db = db;
    });
  }

  _saveTask() async {
    db.rawInsert('INSERT INTO SHOPS(item) VALUES ("${_itemController.text}")');
    _recoverData();
  }

  _recoverData() async {
    List shops = await db.rawQuery("SELECT * FROM SHOPS");
    print(shops);
    setState(() {
      this.shops = shops;
    });
  }

  _modalTask() {
    showDialog(
        context: this.context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Criar item"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  controller: _itemController,
                  autofocus: true,
                  decoration: const InputDecoration(
                      labelText: "Item", hintText: "Digite o item..."),
                ),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancelar")),
              FlatButton(
                  onPressed: () {
                    //salvar
                    _saveTask();

                    Navigator.pop(context);
                  },
                  child: const Text("Salvar"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    _recoverDb();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _title("Lista de compras"),
      body: _body(),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          child: const Icon(Icons.add),
          onPressed: () {
            _modalTask();
          }),
    );
  }

  _body() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(2, 20, 2, 20),
      child: Wrap(
        spacing: 20,
        runSpacing: 20,
        children: <Widget>[],
      ),
    );
  }

  _title(String title) {
    return AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(title,
            style: const TextStyle(color: Colors.white, fontSize: 26)));
  }
}
