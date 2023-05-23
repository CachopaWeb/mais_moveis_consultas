import 'dart:async';

import 'package:dio/dio.dart';

import '../Models/Cliente.dart';

Future<List<Cliente>> fetchClientes(String baseUrl) async {
  BaseOptions options = new BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: Duration(minutes: 5),
    receiveTimeout: Duration(minutes: 3),
  );
  try {
    Dio dio = new Dio(options);
    final response = await dio.get("/clientes");
    final lista = response.data as List;
    final resultado = lista.map((json) => Cliente.fromJson(json)).toList();
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
    Dio dio = new Dio(options);
    final response = await dio.get("/clientes/${id}");
    return Cliente.fromJson(response.data);
  } catch (e) {
    throw Exception(e);
  }
}
