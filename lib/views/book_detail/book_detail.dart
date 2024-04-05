import 'package:buscador_prueba_bancolombia/model/book.dart';
import 'package:buscador_prueba_bancolombia/views/book_detail/book_detail_delegate.dart';
import 'package:buscador_prueba_bancolombia/views/book_detail/book_detail_presenter.dart';
import 'package:flutter/material.dart';

class BooksDetailView extends StatefulWidget {
  
  static String routeName = "/BookDetail";
  Book _book;

  BooksDetailView(this._book);

  @override
  BooksDetailState createState() {
    return BooksDetailState();
  }
  
}

class BooksDetailState extends State<BooksDetailView> implements BookDetailDelegate {
  late BookDetailPresenter detailPresenter;
  bool _isLoading = false;

  BooksDetailState(){
    detailPresenter = BookDetailPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    detailPresenter.loadDetail(widget._book.isbn13 ?? "");
  }
  
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(
        title: const Text(""),
      ),
        body: ListView(
      children: <Widget>[
        Image.network(
          widget._book.image ?? "",
          height: 240.0,
          fit: BoxFit.cover,
        ),
        titleSection(),
        textSection(),
      ],
    ));
  }


  Widget titleSection() {
    return Container(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    widget._book.title ?? "",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  widget._book.language ?? "",
                  style: TextStyle(color: Colors.grey[500]),
                ),
                Text(
                  widget._book.authors ?? "",
                  style: const TextStyle(color: Color.fromARGB(255, 131, 129, 129)),
                ),
              ],
            ),
          ),
           Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Text(widget._book.year ?? "")
        ],
      ),
    );
  }

  Widget textSection() {
    return Container(
        padding: const EdgeInsets.all(32.0),
        child: Text(widget._book.description ?? "",
          softWrap: true,
        ));
  }
  
  @override
  void onDetailRecieved(Book book) {
    widget._book = book;
    setState(() {
        _isLoading = false;
       });
  }
}
