
import 'package:buscador_prueba_bancolombia/model/book.dart';

abstract class BooksRepository {
   Future<List<Book>> fetchBooks(int page);


}

class BooksRepositoryImpl implements BooksRepository{
  @override
  Future<List<Book>> fetchBooks(int page) {
   
   
  }

  
}