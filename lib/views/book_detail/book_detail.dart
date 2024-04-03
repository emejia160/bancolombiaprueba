import 'package:buscador_prueba_bancolombia/model/book.dart';
import 'package:flutter/material.dart';

class BooksDetailView extends StatefulWidget {
  static String routeName = "/BookDetail";
  final Book book;

  BooksDetailView(this.book);

  @override
  BooksDetailState createState() {
    return BooksDetailState();
  }
}

class BooksDetailState extends State<BooksDetailView> {
  @override
  void initState() {
    super.initState();
   
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
