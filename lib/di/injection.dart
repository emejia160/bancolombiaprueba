import 'package:buscador_prueba_bancolombia/repository/books_repository.dart';
import 'package:buscador_prueba_bancolombia/service/network_service.dart';

class Injector {
  static final Injector _singleton = Injector._internal();

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  BooksRepository get booksRepository {
    return BooksRepositoryImpl();
  }

  NetworkService get networkService {
    return NetworkService();
  }
}
