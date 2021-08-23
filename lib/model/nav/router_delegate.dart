import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nav_2/model/nav/book.dart';
import 'package:flutter_nav_2/model/nav/route_path.dart';
import 'package:flutter_nav_2/pages/book_list_page.dart';
import 'package:flutter_nav_2/pages/details_page.dart';
import 'package:flutter_nav_2/pages/settings.dart';
import 'package:flutter_nav_2/pages/unknown_screen.dart';

enum Pages {
  Splash,
  Home,
  Login,
  CreateAccount,
  List,
  Details,
  Cart,
  Checkout,
  Settings
}

extension PagesEx on Pages {
  static const path = {
    Pages.Splash            : '/splash',
    Pages.Home              : '/home',
    Pages.Login             : '/login',
    Pages.CreateAccount     : '/createAccount',
    Pages.List              : '/list',
    Pages.Details           : '/Details',
    Pages.Cart              : '/cart',
    Pages.Checkout          : '/checkout',
    Pages.Settings          : '/settings'
  };
}



/// App State -> Navigation State
class NavRouterDelegate extends RouterDelegate<RoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RoutePath> {

  final GlobalKey<NavigatorState> navigatorKey;

  /// Internal State
  Book?               _selectedBook;
  bool show404        = false;
  bool showSettings   = false;

  List<Book?> books = [
    Book( title: 'DUNE', author: 'Frank Herbert' ),
    Book( title: '2001: A Space Odyssey', author: 'Arthur C. Clark' ),
    Book( title: 'Foundation', author: 'Isaac Asimov' ),
    Book( title: 'Stranger in a Strange Land', author: 'Robert Heinlein' ),
    Book( title: "Hitchhiker's Guide To The Galaxy", author: 'Douglas Adams' ),
  ];

  NavRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  /// You can comment this out without error.
  /// However, the path in the browser URL bar will no longer change.
  RoutePath get currentConfiguration {

    if ( show404 ) {

      print( 'BookRouterDelegate.currentConfiguration -> 404' );
      return RoutePath.unknown();

    }

    if( _selectedBook == null ) {

      print( 'c BookRouterDelegate.currentConfiguration -> NULL' );
      return RoutePath.home();

    } else if( _selectedBook?.title != null ) {

      print( 'a BookRouterDelegate.currentConfiguration -> ' + _selectedBook!.title);
      return RoutePath.details( id: books.indexOf( _selectedBook ) );

    } else if( showSettings == true ) {

      print( 'b BookRouterDelegate.currentConfiguration -> Settings');
      return RoutePath.settings();

    } else  {

      print( 'd BookRouterDelegate.currentConfiguration -> UNKNOWN' );
      return RoutePath.unknown();

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
            onSettings: _handleSettingsTapped,
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
          BookDetailsPage( book: _selectedBook )

         else if( showSettings == true )
           MaterialPage(
             key: ValueKey( 'SettingsPage' ),
               child: PageSettings()
           )


      ],

      onPopPage: ( route, result ) {
        if ( !route.didPop( result ) ) {
          return false;
        }

        // Update the list of pages by setting _selectedBook to null
        _selectedBook = null;
        show404       = false;
        showSettings  = false;
        notifyListeners();

        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath( RoutePath path ) async {
    if ( path.isUnknown ) {
      _selectedBook = null;
      show404 = true;
      return;
    }

    if ( path.isDetailsPage ) {
      showSettings = false;
      if (path.id! < 0
          || path.id! > books.length - 1) {
        show404 = true;
        return;
      }

      _selectedBook = books[path.id!];
    } else if( path.isSettings ) {
      show404       = false;
      showSettings  = true;
      return;
    } else {
      _selectedBook = null;
    }

    show404 = false;
  }

  void _handleBookTapped( Book? book ) {
    _selectedBook = book;
    notifyListeners();
  }

  void _handleSettingsTapped() {
    showSettings = true;
    notifyListeners();
  }
}

/// Create an enum for all of the different possible app-states.
/// Don't use the show404. There should be an enum for "selected book".
/// If the enum is "selected book" then there should be a separate var for the ID of the book.