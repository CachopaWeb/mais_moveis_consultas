import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Models/Cliente.dart';
import '../Pages/ClienteDatail.dart';
import '../Services/ClienteService.dart';

class ClientesPage extends StatefulWidget {
  final String baseUrl;

  ClientesPage({required this.baseUrl});

  @override
  _ClientesPageState createState() => _ClientesPageState();
}

class _ClientesPageState extends State<ClientesPage> {
  List<Cliente> listaClientes = [];
  List<Cliente> listaClientesFiltrada = [];
  bool isSearching = false;

  @override
  void initState() {
    super.initState();
    fetchClientes(widget.baseUrl).then((data) {
      setState(() {
        listaClientes = listaClientesFiltrada = data;
      });
    });
  }

  void _searchClientes(value) {
    setState(() {
      listaClientesFiltrada = listaClientes
          .where((cliente) => cliente.cliNome
              .toUpperCase()
              .contains(value.toString().toUpperCase()))
          .toList();
      if (listaClientesFiltrada.length == 0) {
        listaClientesFiltrada = listaClientes;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: !isSearching
              ? Text('Lista de Clientes')
              : TextField(
                  style: TextStyle(color: Colors.white),
                  autofocus: true,
                  decoration: InputDecoration(
                      hintText: 'Pesquise aqui',
                      hintStyle: TextStyle(color: Colors.white)),
                  onChanged: (value) {
                    _searchClientes(value);
                  },
                ),
          actions: <Widget>[
            IconButton(
                icon: !isSearching ? Icon(Icons.search) : Icon(Icons.cancel),
                onPressed: () {
                  if (isSearching) {
                    listaClientesFiltrada = listaClientes;
                  }
                  setState(() {
                    isSearching = !isSearching;
                  });
                })
          ],
        ),
        body: Container(
            child: listaClientesFiltrada.length > 0
                ? ListView.builder(
                    itemCount: listaClientesFiltrada.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                          elevation: 5,
                          child: ListTile(
                            onTap: () {
                              Navigator.of(context)
                                  .push(CupertinoPageRoute(builder: (_) {
                                return ClienteDetail(
                                  codigo:
                                      listaClientesFiltrada[index].cliCodigo,
                                  baseUrl: widget.baseUrl,
                                );
                              }));
                            },
                            key: Key(listaClientesFiltrada[index]
                                .cliCodigo
                                .toString()),
                            leading: Text(listaClientesFiltrada[index]
                                .cliCodigo
                                .toString()),
                            title: Text(listaClientesFiltrada[index].cliNome),
                            subtitle:
                                Text(listaClientesFiltrada[index].cliFone),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('Carteira'),
                                Text(listaClientesFiltrada[index].cliCarteira)
                              ],
                            ),
                          ));
                    })
                : Center(child: CircularProgressIndicator())));
  }
}
