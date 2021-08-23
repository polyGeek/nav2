/// This is the ADT in the middle.

/// The syntax below uses named constructors. If you're not familiar with that
/// syntax then check out:
/// https://www.geeksforgeeks.org/constructors-in-dart/ (3-Named Constructors)

class RoutePath {
  int? id           = -1;
  bool isUnknown   = false;
  bool isSettings  = false;

  bool get isHomePage     => id == null;
  bool get isDetailsPage  => id != null;

  RoutePath.home()
      : id          = null,
        isSettings  = false,
        isUnknown   = false {
    print( '''Set -> HOME on BookRoutePath
              id        = $id
              isUnknown = $isUnknown
              isSettings  = $isSettings''' );
  }

  RoutePath.details( { this.id } )
      : isUnknown   = false,
        isSettings  = false {
    print( '''Set -> DETAILS on BookRoutePath
              id        = $id
              isUnknown = $isUnknown
              isSettings  = $isSettings''' );
  }

  RoutePath.settings()
      : id          = null,
        isUnknown   = false,
        isSettings  = true {
    print( '''Set -> SETTINGS on BookRoutePath
              id          = null
              isUnknown   = $isUnknown
              isSettings  = $isSettings''' );
  }

  RoutePath.unknown()
      : id          = null,
        isSettings  = false,
        isUnknown   = true {
    print( '''Set -> UNKNOWN on BookRoutePath
              id        = $id
              isUnknown = $isUnknown
              isSettings  = $isSettings''' );
  }


}