import 'dart:async';

import 'package:dio/dio.dart';

import '../Models/Produto.dart';

Future<List<Produto>> fetchProdutos(
    String baseUrl, int page, int limit, String nome) async {
  BaseOptions options = new BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: Duration(minutes: 5),
    receiveTimeout: Duration(minutes: 3),
  );

  try {
    Dio dio = new Dio(options);
    final response =
        await dio.get('/produtos?page=$page&limit=$limit&nome=$nome');
    final lista = response.data as List;
    print(lista);
    final resultado = lista.map((json) => Produto.fromMap(json)).toList();
    return resultado;
  } catch (e) {
    throw Exception(e);
  }
}
