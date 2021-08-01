class Book {
  final String title;
  final String author;

  Book( {
    required this.title,
    required this.author
  } );
}

class BookManager {
  Book? _selectedBook;
  Book get selectedBook => _selectedBook!;
  set selectedBook( Book book ) {
    _selectedBook = book;
  }
}