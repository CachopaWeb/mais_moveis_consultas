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
  final loading = ValueNotifier(false);
  final page = ValueNotifier(1);
  final name = ValueNotifier('');
  late final ScrollController _scrollController;
  List<Produto> listaProdutos = [];
  List<Produto> listaProdutosFiltrada = [];
  bool isSearching = false;

  final int limit = 20;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(infiniteScrolling);
    fetchData();
  }

  @override
  void dispose()
  {
    super.dispose();
    _scrollController.dispose();
  }

  infiniteScrolling()
  async {
    if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent && !loading.value)
    {
      setState(() {
          page.value ++;
          loading.value = true;
        });
      List<Produto> aux = await fetchProdutos(widget.baseUrl, page.value, limit, name.value);
      if(aux.length > 0)
      {
        listaProdutosFiltrada.addAll(aux);
        print('Tamanhho: '+listaProdutosFiltrada.length.toString());
      }
      setState(() {
        loading.value = false;
      });
      
    }

  }

  fetchData({String name =''}) {
    fetchProdutos(widget.baseUrl, page.value, limit, name).then((data) {
      setState(() {
        listaProdutosFiltrada = data;
      });
    });
  }

  bool onlyNumber(String value) {
    bool result = false;
    result = RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]').hasMatch(value);
    return result;
  }

  loadingIndicatorBuilder()
  {
    return ValueListenableBuilder(valueListenable: loading
    , builder: (context, bool isLoading, _)
    {
      return (isLoading)
      ?
      Positioned(
        left: (MediaQuery.of(context).size.width / 2),
        bottom: 24,
        child: const SizedBox(
          width: 40,
          height: 40,
          child: CircleAvatar(
            child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(),
            ),
          ),
        ),
        )
        :
        Container();

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
                    fetchData(name: value);
                    setState(() {
                      name.value = value;
                      page.value = 1;
                    });
                    
                  },
                ),
          actions: <Widget>[
            IconButton(
                icon: !isSearching ? Icon(Icons.search) : Icon(Icons.cancel),
                onPressed: () {
                  if (isSearching) {
                    fetchData();
                    setState(() {
                      page.value = 1;
                    });
                  }
                  setState(() {
                    isSearching = !isSearching;
                  });
                })
          ],
        ),
        body: Container(
            child: listaProdutosFiltrada.length > 0
                ?  Stack(
                  children:[ ListView.builder(
                        controller: _scrollController,
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
                                    listaProdutosFiltrada[index].quantidade != null ?
                                      "Qtd. ${listaProdutosFiltrada[index].quantidade}"
                                      : ''),
                                  trailing: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Text('Valor'),
                                      Text(
                                        listaProdutosFiltrada[index].valorv != null ?
                                          "R\$ ${listaProdutosFiltrada[index].valorv}":
                                          '')
                                    ],
                                  ),
                                ),
                                );
                          }),
                          loadingIndicatorBuilder()
                          ],
                )

                : Center(child: CircularProgressIndicator())));
  }
}
