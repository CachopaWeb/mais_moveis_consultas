import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Pages/ClientesPage.dart';
import 'Pages/ProdutosPage.dart';

import 'Consts/ConstsApp.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mk Consultas',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.red,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.red,
        ),
        textTheme: TextTheme(
            titleMedium: TextStyle(
          fontSize: 16,
          color: Colors.white,
        )),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      themeMode: ThemeMode.dark,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isAdjusting = false;
  String? ip;
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  _salvaIp(String value) async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      isAdjusting = false;
      prefs.setString("ip", value).then((bool success) {
        return value;
      }).then((value) => ip = value);
    });
  }

  @override
  void initState() {
    super.initState();
    isAdjusting = false;
    _prefs.then((SharedPreferences prefs) {
      return (prefs.getString(('ip')));
    }).then((value) => ip = value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Moveis Kill Consultas'),
          actions: <Widget>[
            IconButton(
              icon: !isAdjusting ? Icon(Icons.settings) : Icon(Icons.cancel),
              onPressed: () {
                setState(() {
                  isAdjusting = !isAdjusting;
                });
              },
            ),
          ],
        ),
        body: Container(
          margin: EdgeInsets.all(5),
          alignment: !isAdjusting ? Alignment.center : Alignment.topCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              !isAdjusting
                  ? Opacity(
                      child: Image.asset(ConstsApp.imgLogoMoveisKill),
                      opacity: 0.5,
                    )
                  : TextFormField(
                      keyboardType: TextInputType.number,
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        filled: true,
                        border: UnderlineInputBorder(),
                        icon: Icon(Icons.settings_ethernet),
                        hintText: 'Informe o endereco IP do Servidor',
                        labelText: 'IP *',
                      ),
                      autofocus: true,
                      onFieldSubmitted: (String value) {
                        _salvaIp(value);
                      },
                      initialValue: ip,
                    ),
              SizedBox(
                height: 20,
              ),
              !isAdjusting
                  ? Container(
                      height: 70,
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              stops: [0.3, 1],
                              colors: [Colors.redAccent, Colors.orangeAccent]),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: SizedBox.expand(
                          child: TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              CupertinoPageRoute(builder: (_) {
                            return ProdutosPage(baseUrl: "http://${ip}:9000");
                          }));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Icon(Icons.phonelink_setup),
                            Text(
                              'Produtos',
                              style: Theme.of(context).textTheme.titleMedium,
                            )
                          ],
                        ),
                      )),
                    )
                  : SizedBox(
                      height: 20,
                    ),
              SizedBox(
                height: 20,
              ),
              !isAdjusting
                  ? Container(
                      height: 70,
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              stops: [0.3, 1],
                              colors: [Colors.redAccent, Colors.orangeAccent]),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: SizedBox.expand(
                          child: TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              CupertinoPageRoute(builder: (context) {
                            return ClientesPage(
                              baseUrl: "http://${ip}:9000",
                            );
                          }));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Icon(Icons.person_pin),
                            Text(
                              'Clientes',
                              style: Theme.of(context).textTheme.titleMedium,
                            )
                          ],
                        ),
                      )),
                    )
                  : SizedBox(
                      height: 20,
                    ),
            ],
          ),
        ));
  }
}
