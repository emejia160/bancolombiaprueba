import 'dart:convert';

import 'package:buscador_prueba_bancolombia/main.dart';
import 'package:buscador_prueba_bancolombia/service/network_service.dart';
import 'package:buscador_prueba_bancolombia/views/books/books_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

void main() {
  testWidgets('Test api call', (tester) async {
    
    final networkService = NetworkService();
    networkService.client = MockClient((request) async {
    final mapJson = {'id':123};
      return Response(json.encode(mapJson),200);
    });
    
    // await tester.pumpWidget(BooksView());

    // expect(find.text('Libros encontrados:'), findsOneWidget);
    // expect(find.text('Libro:'), findsNothing);

    // expect(find.text('Ingrese el nombre del libro a buscar:'), findsOneWidget);
    // expect(find.text('Libro:'), findsNothing);
  });
}