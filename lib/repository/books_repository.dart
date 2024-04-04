
import 'dart:convert';

import 'package:buscador_prueba_bancolombia/api_endpoint.dart';
import 'package:buscador_prueba_bancolombia/di/injection.dart';
import 'package:buscador_prueba_bancolombia/model/book.dart';
import 'package:buscador_prueba_bancolombia/service/network_service.dart';
import 'package:http/http.dart' as http;

abstract class BooksRepository {
   Future<List<Book>> fetchBooks(int page, String name);
   Future<Book> fetchBookDetail(String isbn);
}

class BooksRepositoryImpl implements BooksRepository{
  final NetworkService _networkService = Injector().networkService;
  final JsonDecoder _decoder = new JsonDecoder();

  @override
  Future<List<Book>> fetchBooks(int page, String name) async {
   print('books request start');
    final response = await http.get(Uri.parse(ApiEndPoint.BOOKS + name));
    var statusCode = response.statusCode;
    var jsonBody = response.body;

    /*if (statusCode != 200 || null == statusCode) {
      throw new RequestException(
          "Cannnot fecth data, code: $statusCode, ${response.reasonPhrase}");
    }*/

    final body = _decoder.convert(jsonBody);
    final List books = body['books'];

  print('books request response');
  
    return books.map((book) => Book.fromJson(book)).toList();
  }

  @override
  Future<Book> fetchBookDetail(String isbn) async {
    final response = await http.get(Uri.parse(ApiEndPoint.BOOK_DETAIL + isbn));
    var statusCode = response.statusCode;
    var jsonBody = response.body;

    /*if (statusCode != 200 || null == statusCode) {
      throw new RequestException(
          "Cannnot fecth data, code: $statusCode, ${response.reasonPhrase}");
    }*/

    final body = _decoder.convert(jsonBody);
    

  print('books request response');
  
    return  Book.fromJson(body);
  }

  
}