import 'dart:async';

import 'package:dio/dio.dart';

import '../Models/Cliente.dart';

Future<List<Cliente>> fetchClientes(String baseUrl, int page, int limit, String nome) async {
  BaseOptions options = new BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: Duration(minutes: 5),
    receiveTimeout: Duration(minutes: 3),
  );
  try {
    Dio dio = new Dio();
    final response = await dio.get("$baseUrl/clientes?page=$page&limit=$limit&nome=$nome");
    final lista = response.data as List;
    final resultado = lista.map((json) => 
    Cliente.fromMap(json)).toList();
    return resultado;
  } catch (e) {
    throw Exception(e);
  }
}

Future<Cliente> fetchCliente(int id, String baseUrl) async {
  BaseOptions options = new BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: Duration(minutes: 5),
    receiveTimeout: Duration(minutes: 3),
  );
  try {
    Dio dio = new Dio();
    final response = await dio.get("$baseUrl/clientes/${id}");
    return Cliente.fromMap(response.data);
  } catch (e) {
    throw Exception(e);
  }
}
