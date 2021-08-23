
class Book {
  final String title;
  final String author;

  Book( {
    required this.title,
    required this.author
  } );
}

class NavManager {

  static final NavManager _bookManager = NavManager._internal();
  factory NavManager() => _bookManager;
  NavManager._internal();


  Book? _selectedBook;

  Book? getSelectedBook() => _selectedBook;

  set selectedBook( Book newBook ) {
    _selectedBook = newBook;
  }
}