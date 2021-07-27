import 'package:flutter/cupertino.dart';
import 'package:flutter_nav_2/model/nav/book_route_path.dart';

/// This class deals with setting app state in the URL bar
/// and changing app state when the URL value changes.
class BookRouteInformationParser extends RouteInformationParser<BookRoutePath> {

  /// This takes data from the URL bar and changes the app state.
  @override
  Future<BookRoutePath> parseRouteInformation( RouteInformation routeInformation ) async {
    final uri = Uri.parse( routeInformation.location! );
    print( 'The URL changed in the URL bar.' );
    print( 'BookRouteInformationParser.parseRouteInformation: uri -> ' + uri.toString() );

    // Handle '/'
    if ( uri.pathSegments.length == 0 ) {
      print( '  home\n' );
      return BookRoutePath.home();
    }

    // Handle '/book/:id'
    if ( uri.pathSegments.length == 2 ) {

      if ( uri.pathSegments[0] != 'book' ) {
        print( '  unknown\n' );
        return BookRoutePath.unknown();
      }

      // This is the book index number: 0, 1, 2...
      var remaining = uri.pathSegments[ 1 ];
      var id = int.tryParse( remaining );
      if (id == null) {
        print( '  unknown\n' );
        return BookRoutePath.unknown();
      }

      // If we made it to this point then we have a valid URI
      // and can navigate to the selected book.
      print( '  details\n' );
      return BookRoutePath.details( id: id );

    } else {
      // Handle unknown routes
      print( '  unknown\n' );
      return BookRoutePath.unknown();
    }
  }

  /// This reflects the app state in the URL bar.
  @override
  RouteInformation? restoreRouteInformation( BookRoutePath path ) {
    print( 'BookRouteInformationParser.restoreRouteInformation: path -> ' + path.toString() );
    if ( path.isUnknown ) {
      print( '  isUnknown = true\n' );
      return RouteInformation( location: '/404' );
    }
    if ( path.isHomePage ) {
      print( '  location = /');
      return RouteInformation( location: '/\n' );
    }
    if ( path.isDetailsPage ) {
      print( '  isDetailsPage: ' + path.id.toString() + '\n' );
      return RouteInformation( location: '/book/${path.id}' );
    }

    print( '  return NULL\n' );
    return null;
  }
}