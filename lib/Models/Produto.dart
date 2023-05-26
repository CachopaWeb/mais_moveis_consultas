// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Produto {
  int codigo;
  String nome;
  double? quantidade;
  double? valorv;

  Produto({
    required this.codigo,
    required this.nome,
     this.quantidade,
     this.valorv,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'codigo': codigo,
      'nome': nome,
      'quantidade': quantidade,
      'valorv': valorv,
    };
  }

  factory Produto.fromMap(Map<String, dynamic> map) {
    return Produto(
      codigo: map['codigo'] as int,
      nome: map['nome'] as String,
      quantidade: map['quantidade'] != null ? map['quantidade'].toDouble() as double : null,
      valorv: map['valorv'] != null ? map['valorv'].toDouble() as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Produto.fromJson(String source) => Produto.fromMap(json.decode(source) as Map<String, dynamic>);
}
