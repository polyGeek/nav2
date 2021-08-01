/// This is the ADT in the middle.

/// The syntax below uses named constructors. If you're not familiar with that
/// syntax then check out:
/// https://www.geeksforgeeks.org/constructors-in-dart/ (3-Named Constructors)

class BookRoutePath {
  int? id           = -1;
  bool isUnknown   = false;
  bool isSettings  = false;


  BookRoutePath.home()
      : id        = null,
        isUnknown = false {
    print( '''Set -> HOME on BookRoutePath
    id        = $id
    isUnknown = $isUnknown''' );
  }

  BookRoutePath.details( { this.id } )
      : isUnknown = false {
    print( '''Set -> DETAILS on BookRoutePath
    id        = $id
    isUnknown = $isUnknown''' );
  }

  BookRoutePath.settings()
       : id = null,
        isUnknown = false {
    print( '''Set -> SETTINGS on BookRoutePath
    id        = $id
    isUnknown = $isUnknown''' );
  }

  BookRoutePath.unknown()
      : id        = null,
        isUnknown = true {
    print( '''Set -> UNKNOWN on BookRoutePath
    id        = $id
    isUnknown = $isUnknown''' );
  }

  bool get isHomePage => id == null;
  bool get isDetailsPage => id != null;
}