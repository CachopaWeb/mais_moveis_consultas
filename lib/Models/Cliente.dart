// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Cliente {
   final int cliCodigo;
   final String cliNome;
   String? cliEndereco;
   String? cliBairro;
   String? cliCidade;
   String? cliCep;
   String? cliUf;
   String? cliFone;
   String? cliEmail;
   String? cliDatac;
   String? cliTipo;
   String? cliCelular;
   String? cliEndcorresp;
   String? cliObs;
   String? cliCpfCgc;
   String? cliSituacao;
   String? cliRg;
   String? cliDatanasc;
   String? cliPai;
   String? cliMae;
   int? cliSpc;
   int? cliEstcivil;
   String? cliConjuge;
   int? cliInclusaospc;
   String? cliDatainclusao;
   int? cliCheque;
   String? cliCarteira;
   String? cliAvalista;
   String? cliCpfa;
   String? cliFonea;
   String? cliRga;
  Cliente({
    required this.cliCodigo,
    required this.cliNome,
    this.cliEndereco,
    this.cliBairro,
    this.cliCidade,
    this.cliCep,
    this.cliUf,
    this.cliFone,
    this.cliEmail,
    this.cliDatac,
    this.cliTipo,
    this.cliCelular,
    this.cliEndcorresp,
    this.cliObs,
    this.cliCpfCgc,
    this.cliSituacao,
    this.cliRg,
    this.cliDatanasc,
    this.cliPai,
    this.cliMae,
    this.cliSpc,
    this.cliEstcivil,
    this.cliConjuge,
    this.cliInclusaospc,
    this.cliDatainclusao,
    this.cliCheque,
    this.cliCarteira,
    this.cliAvalista,
    this.cliCpfa,
    this.cliFonea,
    this.cliRga,
  });
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cliCodigo': cliCodigo,
      'cliNome': cliNome,
      'cliEndereco': cliEndereco,
      'cliBairro': cliBairro,
      'cliCidade': cliCidade,
      'cliCep': cliCep,
      'cliUf': cliUf,
      'cliFone': cliFone,
      'cliEmail': cliEmail,
      'cliDatac': cliDatac,
      'cliTipo': cliTipo,
      'cliCelular': cliCelular,
      'cliEndcorresp': cliEndcorresp,
      'cliObs': cliObs,
      'cliCpfCgc': cliCpfCgc,
      'cliSituacao': cliSituacao,
      'cliRg': cliRg,
      'cliDatanasc': cliDatanasc,
      'cliPai': cliPai,
      'cliMae': cliMae,
      'cliSpc': cliSpc,
      'cliEstcivil': cliEstcivil,
      'cliConjuge': cliConjuge,
      'cliInclusaospc': cliInclusaospc,
      'cliDatainclusao': cliDatainclusao,
      'cliCheque': cliCheque,
      'cliCarteira': cliCarteira,
      'cliAvalista': cliAvalista,
      'cliCpfa': cliCpfa,
      'cliFonea': cliFonea,
      'cliRga': cliRga,
    };
  }

  factory Cliente.fromMap(Map<String, dynamic> map) {
    return Cliente(
      cliCodigo: map['cliCodigo'] as int,
      cliNome: map['cliNome'] as String,
      cliEndereco: map['cliEndereco'] != null ? map['cliEndereco'] as String : null,
      cliBairro: map['cliBairro'] != null ? map['cliBairro'] as String : null,
      cliCidade: map['cliCidade'] != null ? map['cliCidade'] as String : null,
      cliCep: map['cliCep'] != null ? map['cliCep'] as String : null,
      cliUf: map['cliUf'] != null ? map['cliUf'] as String : null,
      cliFone: map['cliFone'] != null ? map['cliFone'] as String : null,
      cliEmail: map['cliEmail'] != null ? map['cliEmail'] as String : null,
      cliDatac: map['cliDatac'] != null ? map['cliDatac'] as String : null,
      cliTipo: map['cliTipo'] != null ? map['cliTipo'] as String : null,
      cliCelular: map['cliCelular'] != null ? map['cliCelular'] as String : null,
      cliEndcorresp: map['cliEndcorresp'] != null ? map['cliEndcorresp'] as String : null,
      cliObs: map['cliObs'] != null ? map['cliObs'] as String : null,
      cliCpfCgc: map['cliCpfCgc'] != null ? map['cliCpfCgc'] as String : null,
      cliSituacao: map['cliSituacao'] != null ? map['cliSituacao'] as String : null,
      cliRg: map['cliRg'] != null ? map['cliRg'] as String : null,
      cliDatanasc: map['cliDatanasc'] != null ? map['cliDatanasc'] as String : null,
      cliPai: map['cliPai'] != null ? map['cliPai'] as String : null,
      cliMae: map['cliMae'] != null ? map['cliMae'] as String : null,
      cliSpc: map['cliSpc'] != null ? map['cliSpc'] as int : null,
      cliEstcivil: map['cliEstcivil'] != null ? map['cliEstcivil'] as int : null,
      cliConjuge: map['cliConjuge'] != null ? map['cliConjuge'] as String : null,
      cliInclusaospc: map['cliInclusaospc'] != null ? map['cliInclusaospc'] as int : null,
      cliDatainclusao: map['cliDatainclusao'] != null ? map['cliDatainclusao'] as String : null,
      cliCheque: map['cliCheque'] != null ? map['cliCheque'] as int : null,
      cliCarteira: map['cliCarteira'] != null ? map['cliCarteira'] as String : null,
      cliAvalista: map['cliAvalista'] != null ? map['cliAvalista'] as String : null,
      cliCpfa: map['cliCpfa'] != null ? map['cliCpfa'] as String : null,
      cliFonea: map['cliFonea'] != null ? map['cliFonea'] as String : null,
      cliRga: map['cliRga'] != null ? map['cliRga'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Cliente.fromJson(String source) => Cliente.fromMap(json.decode(source) as Map<String, dynamic>);
}
