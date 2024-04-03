import 'package:buscador_prueba_bancolombia/model/book.dart';
import 'package:buscador_prueba_bancolombia/views/book_detail/book_detail.dart';
import 'package:buscador_prueba_bancolombia/views/books/books_delegate.dart';
import 'package:buscador_prueba_bancolombia/views/books/books_presenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BooksView extends StatefulWidget {
   static String routeName = "/BookDetail";

  @override
  BooksViewState createState() {
    return BooksViewState();
  }
}

class BooksViewState extends State<BooksView> implements BooksDelegate{
  late BooksPresenter booksPresenter;
  late List<Book> _books;
  bool _isLoading = false;
  bool _isRefreshing = false;
  bool _isLoadMore = false;
  
  @override
  void initState() {
    super.initState();
    booksPresenter.loadBooks(1, "");
    _books = <Book>[];
   
  }
  
  BooksViewState(){
    booksPresenter = BooksPresenter(this);

  } 
  @override
  Widget build(BuildContext context) {
     print("build list");
    return setupBooksView(context);
  }

  Widget setupBooksView(BuildContext context) {
      return Scaffold(
        body: ListView(
      children: <Widget>[
        TextField(
  onChanged: (text) {
    booksPresenter.loadBooks(1, text);
  },
  decoration: InputDecoration(hintText: 'Ingrese el nombre del libro a buscar:'),
),
        setupListItemCard(context),
      ],
    ));
  }

  Card setupListItemCard(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: [
          ListTile(
            title: Text('Libros encontrados: '),
          ),
          Divider(),
          ListView.builder(
            itemCount: _books.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return buiildBookItem(index, context);
            },
          ),
        ],
      ),
    );
  }

  BookItem buiildBookItem(int index, BuildContext context) {
    print("build item book");
    return BookItem(
      book: _books[index],
      onTap: () {
        print("Item clicked: ${_books[index].title}");
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => BooksDetailView(_books[index])));
      },
      context: context,
    );
  }
  

  @override
  void onBooksRecieved(List<Book> books) {
      print('books recieved');
      _books.clear();
       if (books.length > 0) {
        _books.addAll(books);
       }
       setState(() {
        _isLoading = false;
       });
  }


}

class BookItem extends ListTile {
  BookItem({required Book book, required GestureTapCallback onTap, required BuildContext context})
      : super(
            title: new Text(book.title),
            subtitle: new Text(book.subtitle),
            leading: Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(book.image),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.all(new Radius.circular(50.0)),
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 2.0,
                  ),
                )),
            onTap: onTap);
}


