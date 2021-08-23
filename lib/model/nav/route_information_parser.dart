import 'package:flutter/cupertino.dart';
import 'package:flutter_nav_2/model/nav/route_path.dart';

/// This class deals with setting app state in the URL bar
/// and changing app state when the URL value changes.
class NavRouteInformationParser extends RouteInformationParser<RoutePath> {

  /// This takes data from the URL bar and changes the app state.
  @override
  Future<RoutePath> parseRouteInformation( RouteInformation routeInformation ) async {
    final uri = Uri.parse( routeInformation.location! );
    print( '======================================================');
    print( 'The URL changed in the URL bar.' );
    print( 'BookRouteInformationParser.parseRouteInformation: uri -> ' + uri.toString() );

    // Handle '/'
    if ( uri.pathSegments.length == 0 ) {
      print( '  <<<home>>>\n' );
      return RoutePath.home();
    }

    // Handle '/book/:id'
    if ( uri.pathSegments.length == 2 ) {

      /*
      This logic needs to change. In the future there could be other
      stings at pathSegments[0] than 'book'. The RoutePath.unknown should
      be left to the very end of no other option is found.
      */
      if ( uri.pathSegments[0] != 'book' ) {
        print( '  <<<unknown>>>\n' );
        return RoutePath.unknown();
      }

      // This is the book index number: 0, 1, 2...
      var remaining = uri.pathSegments[ 1 ];
      var id = int.tryParse( remaining );
      if (id == null) {
        print( '  <<<unknown>>>\n' );
        return RoutePath.unknown();
      }

      // If we made it to this point then we have a valid URI
      // and can navigate to the selected book.
      print( '  <<<details>>>\n' );
      return RoutePath.details( id: id );

    } else if( uri.pathSegments[0] == 'settings' ) {

      print( '   <<<Settings>>>\n' );
      return RoutePath.settings();

    } else {
      // Handle unknown routes
      print( '  <<<unknown>>>\n' );
      return RoutePath.unknown();
    }
  }

  /// This reflects the app state in the URL bar.
  @override
  RouteInformation? restoreRouteInformation( RoutePath path ) {
    print( 'BookRouteInformationParser.restoreRouteInformation: path -> ' + path.toString() );

    if ( path.isUnknown ) {

      print( '  isUnknown = true\n' );
      return RouteInformation( location: '/404' );

    } else  if ( path.isHomePage ) {

      print(  '  location = /' );
      return RouteInformation( location: '/\n' );

    } else if ( path.isDetailsPage ) {

      print( '  isDetailsPage: ' + path.id.toString() + '\n' );
      return RouteInformation( location: '/book/${path.id}' );

    } else if( path.isSettings == true ) {

      print( '  isSettings Page ' );
      return RouteInformation( location: '/settings' );

    }

      print( '  return NULL\n' );
    return null;
  }
}