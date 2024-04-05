import 'package:buscador_prueba_bancolombia/model/book.dart';

abstract class BooksDelegate {
  void onBooksRecieved(List<Book> books);
  void onLastestSearch(List<String> list);
  void onSearchSaved(List<String> list);
}