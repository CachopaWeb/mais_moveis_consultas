// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Models/Cliente.dart';
import '../Services/ClienteService.dart';

class ClienteDetail extends StatefulWidget {
  final int codigo;
  final String baseUrl;

  ClienteDetail({required this.codigo, required this.baseUrl});

  @override
  _ClienteDetailState createState() => _ClienteDetailState();
}

class _ClienteDetailState extends State<ClienteDetail> {
  late Cliente dadosCliente;
  bool isLoading = true;

  @override
  void initState() {
    fetchCliente(widget.codigo, widget.baseUrl).then((value) {
      setState(() {
        dadosCliente = value;
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes do Cliente"),
      ),
      body: !isLoading
          ? Card(
              elevation: 5,
              child: ListView(
                children: <Widget>[
                  Campos(
                      nomeCampo: 'Codigo',
                      valorCampo: dadosCliente.cliCodigo.toString()),
                  Campos(
                      nomeCampo: 'Nome',
                      valorCampo: dadosCliente.cliNome.toString()),
                  Campos(
                      nomeCampo: 'Tipo',
                      valorCampo: dadosCliente.cliTipo != null ?
                      dadosCliente.cliTipo.toString()
                      : ''),
                  Campos(
                      nomeCampo: 'CPF/CNPJ',
                      valorCampo: 
                      dadosCliente.cliCpfCgc != null ?
                      dadosCliente.cliCpfCgc.toString()
                      
                      :'   .   .   -  '),
                  Campos(
                      nomeCampo: 'RG',
                      valorCampo: dadosCliente.cliRg != null?
                      dadosCliente.cliRg.toString()
                      :''),
                  Campos(
                      nomeCampo: 'Carteira',
                      valorCampo: dadosCliente.cliCarteira != null ?
                      dadosCliente.cliCarteira.toString()
                      : ''),
                  Campos(
                    nomeCampo: 'SPC',
                    valorCampo: dadosCliente.cliSpc != null ?
                    dadosCliente.cliSpc.toString()
                    : '4',
                    isSpc: true,
                  ),
                  Campos(
                    nomeCampo: 'Cheque do Cliente',
                    valorCampo: dadosCliente.cliCheque != null ?
                    dadosCliente.cliCheque.toString()
                    :'4',
                    isCheque: true,
                  ),
                  Campos(
                    nomeCampo: 'Estado Civil',
                    valorCampo: dadosCliente.cliEstcivil != null ?
                    dadosCliente.cliEstcivil.toString()
                    :'5',
                    isEstadoCivil: true,
                  ),
                  Campos(
                      nomeCampo: 'Fone',
                      valorCampo: dadosCliente.cliFone != null ?
                      dadosCliente.cliFone.toString()
                      : '( )    -    '),
                  Campos(
                      nomeCampo: 'Endereco',
                      valorCampo: dadosCliente.cliEndereco != null ?
                      dadosCliente.cliEndereco.toString()
                      :''),
                  Campos(
                      nomeCampo: 'Bairro',
                      valorCampo: dadosCliente.cliBairro != null ?
                      dadosCliente.cliBairro.toString()
                      :''),
                  Campos(
                      nomeCampo: 'Cidade',
                      valorCampo: dadosCliente.cliCidade != null?
                      dadosCliente.cliCidade.toString()
                      :''),
                  Campos(
                      nomeCampo: 'UF',
                      valorCampo: dadosCliente.cliUf != null?
                      dadosCliente.cliUf.toString()
                      :''),
                  Campos(
                      nomeCampo: 'CEP',
                      valorCampo: dadosCliente.cliCep != null ?
                      dadosCliente.cliCep.toString()
                      :'     -   '),
                  Campos(
                    nomeCampo: 'Data Cadastro',
                    valorCampo: dadosCliente.cliDatac !=null ?
                    DateFormat('dd/MM/yyyy')
                        .format(DateTime.parse(dadosCliente.cliDatac!)
                        )
                        :'  /  /   '
                  ),
                  Campos(
                      nomeCampo: 'Nome Conjugue',
                      valorCampo: dadosCliente.cliConjuge != null ?
                      dadosCliente.cliConjuge.toString()
                      :''),
                  Card(
                    elevation: 10,
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Dados Avalista',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Campos(
                          nomeCampo: 'Nome',
                          valorCampo: dadosCliente.cliAvalista != null ?
                          dadosCliente.cliAvalista.toString()
                          :'',
                        ),
                        Campos(
                          nomeCampo: 'CPF',
                          valorCampo: dadosCliente.cliCpfa != null ?
                          dadosCliente.cliCpfa.toString()
                          :'   .   .   -  ',
                        ),
                        Campos(
                          nomeCampo: 'RG',
                          valorCampo: dadosCliente.cliRga != null ?
                          dadosCliente.cliRga.toString()
                          :'',
                        ),
                        Campos(
                          nomeCampo: 'Fone',
                          valorCampo: dadosCliente.cliFonea != null ?
                          dadosCliente.cliRga.toString()
                          : '( )    -    ',
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}

class Campos extends StatelessWidget {
  final String valorCampo;
  final String nomeCampo;
  final bool isSpc;
  final bool isCheque;
  final bool isEstadoCivil;
  Campos(
      {Key? key,
      required this.valorCampo,
      required this.nomeCampo,
      this.isSpc = false,
      this.isCheque = false,
      this.isEstadoCivil = false})
      : super(key: key);
  final List<String> spc = ['NC', 'NEG', 'S/C', ''];
  final List<String> cheque = ['NC', 'CR', 'BL', ''];
  final List<String> estadoCivil = ['CAS.', 'SOLT.', 'VIUVO', 'SEP.', ''];

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        nomeCampo,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
      subtitle: !isSpc && !isCheque && !isEstadoCivil
          ? //!radio
          Text(
              valorCampo != null ? valorCampo : "",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            )
          : isSpc
              ? Text(
                  spc[int.parse(valorCampo) - 1],
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                )
              : isCheque
                  ? Text(
                      cheque[int.parse(valorCampo) - 1],
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    )
                  : Text(
                      estadoCivil[int.parse(valorCampo) - 1],
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
      dense: true,
      trailing: Icon(Icons.person_pin_circle),
    );
  }
}
