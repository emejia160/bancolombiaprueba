import 'package:buscador_prueba_bancolombia/constants/strings.dart';
import 'package:buscador_prueba_bancolombia/model/book.dart';
import 'package:buscador_prueba_bancolombia/views/book_detail/book_detail.dart';
import 'package:buscador_prueba_bancolombia/views/books/books_delegate.dart';
import 'package:buscador_prueba_bancolombia/views/books/books_presenter.dart';
import 'package:flutter/material.dart';

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
  String _searchText = "";
  List<String> lastestSearch = [];
  
  @override
  void initState() {
    super.initState();
    booksPresenter.loadBooks(1, "");
    booksPresenter.loadLastestSearch();
    _books = <Book>[];
   
  }
  
  BooksViewState(){
    booksPresenter = BooksPresenter(this);

  } 
  @override
  Widget build(BuildContext context) {
    return setupBooksView(context);
  }

  Widget setupBooksView(BuildContext context) {
      return Scaffold(
       appBar: AppBar(
        title: const Text(Strings.apBarText),
      ),
        body: ListView(
      children: <Widget>[
        TextField(
  onChanged: (text) {
    _searchText = text;
  },
  decoration: const InputDecoration(hintText: Strings.searchBookHint),
),
   IconButton(
                  icon: Icon(Icons.search),
                  onPressed: (){
                    booksPresenter.loadBooks(1, _searchText);
                    booksPresenter.saveSearch(_searchText);
                  }),
        setupLastestSearchCard(context),
        setupListItemCard(context),
     
      ],
    ));
  }

  Card setupLastestSearchCard(BuildContext context) {
 return Card(
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: [
          const ListTile(
            title: Text("Búsquedas recientes:"),
          ),
          Divider(),
          ListView.builder(
            itemCount: lastestSearch.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final data = lastestSearch[index];
                      return ListTile(
                          title: Text(data),
                          onTap: (){
                              booksPresenter.loadBooks(1, data);
                          });
            },
          ),
        ],
      ),
    );
  }

  Card setupListItemCard(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: [
          const ListTile(
            title: Text(Strings.booksFound),
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
    return BookItem(
      book: _books[index],
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => BooksDetailView(_books[index])));
      },
      context: context,
    );
  }
  

  @override
  void onBooksRecieved(List<Book> books) {
      _books.clear();
       if (books.isNotEmpty) {
        _books.addAll(books);
       }
       setState(() {
       });
  }
  
  @override
  void onLastestSearch(List<String> list) {
     if (list.isNotEmpty) {
        lastestSearch.addAll(list);
       }
       setState(() {
       });
  }
  
  @override
  void onSearchSaved(List<String> list) {
    lastestSearch.clear();
     if (list.isNotEmpty) {
        lastestSearch.addAll(list);
       }
       setState(() {
       });
  }


}

class BookItem extends ListTile {
  BookItem({required Book book, required GestureTapCallback onTap, required BuildContext context})
      : super(
            title: Text(book.title ?? ""),
            subtitle: Text(book.subtitle ?? ""),
            leading: Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(book.image ?? ""),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.all(new Radius.circular(50.0)),
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 2.0,
                  ),
                )),
            onTap: onTap);
}


