import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nav_2/model/nav/book.dart';
import 'package:flutter_nav_2/model/nav/book_route_path.dart';
import 'package:flutter_nav_2/pages/book_list_page.dart';
import 'package:flutter_nav_2/pages/details_page.dart';
import 'package:flutter_nav_2/pages/unknown_screen.dart';

/// App State -> Navigation State
class BookRouterDelegate extends RouterDelegate<BookRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<BookRoutePath> {

  final GlobalKey<NavigatorState> navigatorKey;

  /// Internal State
  Book? _selectedBook;
  bool show404 = false;

  List<Book?> books = [
    Book( title: 'DUNE', author: 'Frank Herbert' ),
    Book( title: '2001: A Space Odyssey', author: 'Arthur C. Clark' ),
    Book( title: 'Foundation', author: 'Isaac Asimov' ),
    Book( title: 'Stranger in a Strange Land', author: 'Robert Heinlein' ),
    Book( title: "Hitchhiker's Guide To The Galaxy", author: 'Douglas Adams' ),
  ];

  BookRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  BookRoutePath get currentConfiguration {

    if ( show404 ) {
      print( 'BookRouterDelegate.currentConfiguration -> 404' );
      return BookRoutePath.unknown();
    }

    if( _selectedBook == null ) {
      print( 'BookRouterDelegate.currentConfiguration -> NULL' );
      return BookRoutePath.home();
    } else {
      print( 'BookRouterDelegate.currentConfiguration -> ' + _selectedBook!.title );
      return BookRoutePath.details( id: books.indexOf( _selectedBook ) );
    }
  }

  /// In the *Navigator* below is a list of *MaterialPages* that will be
  /// added to the stack based on the application state.
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [

        /// Based on the lack of logic here you can see that the
        /// *BooksListScreen* (Home Screen) will ALWAYS be on the stack
        /// no matter what.
        MaterialPage(
          key: ValueKey( 'BooksListPage' ),
          child: BooksListScreen(
            books: books,
            onTapped: _handleBookTapped,
          ),
        ),

        /// Below is a simple if/else to add pages to the stack.
        /// You can see that based on the logic only one other page
        /// can be on the stack: 404 or Book Details page.
        if( show404 )
          MaterialPage(
            key: ValueKey( 'UnknownPage' ),
            child: UnknownScreen(),
          )

        else if( _selectedBook != null )
          BookDetailsPage(
              book: _selectedBook
          )

      ],

      onPopPage: ( route, result ) {
        if ( !route.didPop( result ) ) {
          return false;
        }

        // Update the list of pages by setting _selectedBook to null
        _selectedBook = null;
        show404 = false;
        notifyListeners();

        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath( BookRoutePath path ) async {
    if ( path.isUnknown ) {
      _selectedBook = null;
      show404 = true;
      return;
    }

    if ( path.isDetailsPage ) {
      if ( path.id! < 0
          || path.id! > books.length - 1 ) {

        show404 = true;
        return;
      }

      _selectedBook = books[path.id!];

    } else {
      _selectedBook = null;
    }

    show404 = false;
  }

  void _handleBookTapped( Book? book ) {
    _selectedBook = book;
    notifyListeners();
  }
}