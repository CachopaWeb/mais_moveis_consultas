// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Cliente {
  final int cliCodigo;
  final String cliNome;
  final String cliEndereco;
  final String cliBairro;
  final String cliCidade;
  final String cliCep;
  final String cliUf;
  final String cliFone;
  final String cliEmail;
  final String cliDatac;
  final String cliTipo;
  final String cliCelular;
  final String cliEndcorresp;
  final String cliObs;
  final String cliCpfCgc;
  final String cliSituacao;
  final String cliRg;
  final String cliDatanasc;
  final String cliPai;
  final String cliMae;
  final String cliSpc;
  final String cliEstcivil;
  final String cliConjuge;
  final String cliInclusaospc;
  final String cliDatainclusao;
  final String cliCheque;
  final String cliCarteira;
  final String cliAvalista;
  final String cliCpfa;
  final String cliFonea;
  final String cliRga;
  Cliente({
    required this.cliCodigo,
    required this.cliNome,
    required this.cliEndereco,
    required this.cliBairro,
    required this.cliCidade,
    required this.cliCep,
    required this.cliUf,
    required this.cliFone,
    required this.cliEmail,
    required this.cliDatac,
    required this.cliTipo,
    required this.cliCelular,
    required this.cliEndcorresp,
    required this.cliObs,
    required this.cliCpfCgc,
    required this.cliSituacao,
    required this.cliRg,
    required this.cliDatanasc,
    required this.cliPai,
    required this.cliMae,
    required this.cliSpc,
    required this.cliEstcivil,
    required this.cliConjuge,
    required this.cliInclusaospc,
    required this.cliDatainclusao,
    required this.cliCheque,
    required this.cliCarteira,
    required this.cliAvalista,
    required this.cliCpfa,
    required this.cliFonea,
    required this.cliRga,
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
      cliEndereco: map['cliEndereco'] as String,
      cliBairro: map['cliBairro'] as String,
      cliCidade: map['cliCidade'] as String,
      cliCep: map['cliCep'] as String,
      cliUf: map['cliUf'] as String,
      cliFone: map['cliFone'] as String,
      cliEmail: map['cliEmail'] as String,
      cliDatac: map['cliDatac'] as String,
      cliTipo: map['cliTipo'] as String,
      cliCelular: map['cliCelular'] as String,
      cliEndcorresp: map['cliEndcorresp'] as String,
      cliObs: map['cliObs'] as String,
      cliCpfCgc: map['cliCpfCgc'] as String,
      cliSituacao: map['cliSituacao'] as String,
      cliRg: map['cliRg'] as String,
      cliDatanasc: map['cliDatanasc'] as String,
      cliPai: map['cliPai'] as String,
      cliMae: map['cliMae'] as String,
      cliSpc: map['cliSpc'] as String,
      cliEstcivil: map['cliEstcivil'] as String,
      cliConjuge: map['cliConjuge'] as String,
      cliInclusaospc: map['cliInclusaospc'] as String,
      cliDatainclusao: map['cliDatainclusao'] as String,
      cliCheque: map['cliCheque'] as String,
      cliCarteira: map['cliCarteira'] as String,
      cliAvalista: map['cliAvalista'] as String,
      cliCpfa: map['cliCpfa'] as String,
      cliFonea: map['cliFonea'] as String,
      cliRga: map['cliRga'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Cliente.fromJson(String source) =>
      Cliente.fromMap(json.decode(source) as Map<String, dynamic>);
}
