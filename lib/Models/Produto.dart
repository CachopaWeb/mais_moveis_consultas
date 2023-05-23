class Produto {
  int codigo;
  String nome;
  double quantidade;
  double valorv;

  Produto({
    required this.codigo,
    required this.nome,
    required this.quantidade,
    required this.valorv,
  });

  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(
      codigo: json['codigo'] as int,
      nome: json['nome'] as String,
      quantidade: json['quantidade'] as double,
      valorv: json['valorv'] as double,
    );
  }
}
