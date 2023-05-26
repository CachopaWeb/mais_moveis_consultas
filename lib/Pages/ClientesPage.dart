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
    final loading = ValueNotifier(false);
  final page = ValueNotifier(1);
  final name = ValueNotifier('');
  late final ScrollController _scrollController;
  List<Cliente> listaClientes = [];
  List<Cliente> listaClientesFiltrada = [];
  bool isSearching = false;
  int limit = 20;

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
      List<Cliente> aux = await fetchClientes(widget.baseUrl, page.value, limit, name.value);
      if(aux.length > 0)
      {
        listaClientesFiltrada.addAll(aux);
      }
      setState(() {
        loading.value = false;
      });
      
    }

  }


  fetchData({String name  = ''})
  {
    fetchClientes(widget.baseUrl,page.value, limit, name).then((data) {
      setState(() {
        listaClientes = listaClientesFiltrada = data;
      });
    });

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
              ? Text('Lista de Clientes')
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
            child: listaClientesFiltrada.length > 0
                ? Stack(
                  children: [ListView.builder(
                    controller: _scrollController,
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
                                  Text(
                                    listaClientesFiltrada[index].cliFone != null ? listaClientesFiltrada[index].cliFone! 
                                    : '( )    -    ' 
                                    ),
                              trailing: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text('Carteira'),
                                  Text(listaClientesFiltrada[index].cliCarteira!)
                                ],
                              ),
                            ));
                      }),
                      loadingIndicatorBuilder()
                      ],
                )
                : Center(child: CircularProgressIndicator())));
  }
}
