import 'package:buscador_prueba_bancolombia/di/injection.dart';
import 'package:buscador_prueba_bancolombia/repository/books_repository.dart';
import 'package:buscador_prueba_bancolombia/views/book_detail/book_detail_delegate.dart';

class BookDetailPresenter {
  late BooksRepository booksRepository;
  BookDetailDelegate _view;

  BookDetailPresenter(this._view) {
    booksRepository = Injector().booksRepository;
  }

  Future<void> loadDetail(String isbn) async {
    booksRepository
        .fetchBookDetail(isbn)
        .then((book) => _view.onDetailRecieved(book))
        .catchError((onError) {
      print(onError);
    });
  }
}