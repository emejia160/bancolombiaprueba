
import 'dart:convert';

import 'package:buscador_prueba_bancolombia/api_endpoint.dart';
import 'package:buscador_prueba_bancolombia/model/book.dart';
import 'package:http/http.dart' as http;

abstract class BooksRepository {
   Future<List<Book>> fetchBooks(int page, String name);
   Future<Book> fetchBookDetail(String isbn);
}

class BooksRepositoryImpl implements BooksRepository{
  final JsonDecoder _decoder = const JsonDecoder();

  @override
  Future<List<Book>> fetchBooks(int page, String name) async {

    if (name.isEmpty) {
      return [];
    }
    
    final response = await http.get(Uri.parse(ApiEndPoint.BOOKS + name));
    var jsonBody = response.body;

    final body = _decoder.convert(jsonBody);
    final List books = body['books'];
  
    return books.map((book) => Book.fromJson(book)).toList();
  }

  @override
  Future<Book> fetchBookDetail(String isbn) async {
    final response = await http.get(Uri.parse(ApiEndPoint.BOOK_DETAIL + isbn));
    var jsonBody = response.body;

    final body = _decoder.convert(jsonBody);
  
    return  Book.fromJson(body);
  }

  
}