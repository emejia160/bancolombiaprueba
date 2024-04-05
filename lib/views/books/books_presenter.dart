
import 'package:buscador_prueba_bancolombia/di/injection.dart';
import 'package:buscador_prueba_bancolombia/repository/books_repository.dart';
import 'package:buscador_prueba_bancolombia/utils/shared_preferences.dart';
import 'package:buscador_prueba_bancolombia/views/books/books_delegate.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class BooksPresenter {
  static const String _keyData = 'lastest_search';
  late BooksRepository booksRepository;
  final cache = DefaultCacheManager();
  BooksDelegate _view;

  BooksPresenter(this._view) {
    booksRepository = Injector().booksRepository;
  }

  Future<void> loadBooks(int page, String name) async {
    booksRepository
        .fetchBooks(page, name)
        .then((contacts) => _view.onBooksRecieved(contacts))
        .catchError((onError) {
      print(onError);
    });
  }

  Future<void> loadLastestSearch() async {
   
    final list = SharedPreferenceUtils.getStringList(_keyData);
    _view.onLastestSearch(list as List<String>);
      
  }

  Future<void> saveSearch(String text) async {
   final list = await SharedPreferenceUtils.getStringList(_keyData);
    list.add(text);
    SharedPreferenceUtils.putStringList(_keyData, list);
    _view.onSearchSaved(list);
     

  }
}
       
   