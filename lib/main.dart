import 'package:buscador_prueba_bancolombia/views/books/books_view.dart';
import 'package:buscador_prueba_bancolombia/views/splash/splash_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prueba Técnica Bancolombia',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
       routes: <String, WidgetBuilder>{
          BooksView.routeName: (BuildContext context) {
            return BooksView();
          }
        },
      home: Splash(),
    );
  }
}

