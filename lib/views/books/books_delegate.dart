import 'package:buscador_prueba_bancolombia/model/book.dart';

abstract class BooksDelegate {
  void onBooksRecieved(List<Book> books);
}