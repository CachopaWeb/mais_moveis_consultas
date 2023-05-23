import 'package:flutter/material.dart';

import '../Models/Produto.dart';
import '../Services/ProdutoService.dart';

class ProdutosPage extends StatefulWidget {
  final String baseUrl;

  ProdutosPage({required this.baseUrl});

  @override
  _ProdutosPageState createState() => _ProdutosPageState();
}

class _ProdutosPageState extends State<ProdutosPage> {
  List<Produto> listaProdutos = [];
  List<Produto> listaProdutosFiltrada = [];
  bool isSearching = false;
  int page = 1;
  final int limit = 10;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() {
    fetchProdutos(widget.baseUrl, page, limit).then((data) {
      setState(() {
        listaProdutos = listaProdutosFiltrada = data;
      });
    });
  }

  bool onlyNumber(String value) {
    bool result = false;
    result = RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]').hasMatch(value);
    return result;
  }

  void _searchProdutos(value) {
    setState(() {
      try {
        if (onlyNumber(value)) {
          listaProdutosFiltrada = listaProdutos
              .where((pro) => pro.codigo
                  .toString()
                  .toUpperCase()
                  .contains(value.toString().toUpperCase()))
              .toList();
        } else {
          listaProdutosFiltrada = listaProdutos
              .where((pro) => pro.nome
                  .toUpperCase()
                  .contains(value.toString().toUpperCase()))
              .toList();
        }
      } catch (error) {
        print(error);
      }
      if (listaProdutosFiltrada.length == 0) {
        listaProdutosFiltrada = listaProdutos;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: !isSearching
              ? Text('Lista de Produtos')
              : TextField(
                  style: TextStyle(color: Colors.white),
                  autofocus: true,
                  decoration: InputDecoration(
                      hintText: 'Pesquise aqui',
                      hintStyle: TextStyle(color: Colors.white)),
                  onChanged: (value) {
                    _searchProdutos(value);
                  },
                ),
          actions: <Widget>[
            IconButton(
                icon: !isSearching ? Icon(Icons.search) : Icon(Icons.cancel),
                onPressed: () {
                  if (isSearching) {
                    listaProdutosFiltrada = listaProdutos;
                  }
                  setState(() {
                    isSearching = !isSearching;
                  });
                })
          ],
        ),
        body: Container(
            child: listaProdutosFiltrada.length > 0
                ? ListView.builder(
                    itemCount: listaProdutosFiltrada.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                          elevation: 5,
                          child: ListTile(
                            key: Key(
                                listaProdutosFiltrada[index].codigo.toString()),
                            leading: Text(
                                listaProdutosFiltrada[index].codigo.toString()),
                            title: Text(listaProdutosFiltrada[index].nome),
                            subtitle: Text(
                                "Qtd. ${listaProdutosFiltrada[index].quantidade}"),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text('Valor'),
                                Text(
                                    "R\$ ${listaProdutosFiltrada[index].valorv}")
                              ],
                            ),
                          ));
                    })
                : Center(child: CircularProgressIndicator())));
  }
}
