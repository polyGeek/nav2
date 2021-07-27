/// This is the ADT in the middle.

/// The syntax below was totally new to me. A good example of how this
/// is used in Flutter is the Point class. You can check that out as
/// an example. Also, read the excellent answer to this question on StackExchange
/// https://stackoverflow.com/questions/50274605/colon-after-constructor-in-dart

class BookRoutePath {
  final int? id;
  final bool isUnknown;


  BookRoutePath.home()
      : id = null,
        isUnknown = false {
    print( 'Set -> HOME on BookRoutePath\n   id = ' + id.toString() + '\n   isUnknown = ' + isUnknown.toString() + '\n' );
  }

  BookRoutePath.details( { this.id } )
      : isUnknown = false {
    print( 'Set -> DETAILS on BookRoutePath\n   id = ' + id.toString() + '\n   isUnknown = ' + isUnknown.toString() + '\n' );
  }

  BookRoutePath.unknown()
      : id = null,
        isUnknown = true{
    print( 'Set -> UNKNOWN on BookRoutePath\n   id = ' + id.toString() + '\n   isUnknown = ' + isUnknown.toString() + '\n' );
  }

  bool get isHomePage => id == null;

  bool get isDetailsPage => id != null;
}