import 'package:buscador_prueba_bancolombia/di/injection.dart';
import 'package:buscador_prueba_bancolombia/repository/books_repository.dart';
import 'package:buscador_prueba_bancolombia/views/books/books_delegate.dart';

class BooksPresenter {
  late BooksRepository booksRepository;
  BooksDelegate _view;

  BooksPresenter(this._view) {
    booksRepository = Injector().booksRepository;
  }

  Future<void> loadBooks(int page, String name) async {
print('books response presenter');
    booksRepository
        .fetchBooks(page, name)
        .then((contacts) => _view.onBooksRecieved(contacts))
        .catchError((onError) {
      print(onError);
    });
  }
}