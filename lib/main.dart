import 'package:flutter/material.dart';
import 'package:flutter_nav_2/model/nav/route_information_parser.dart';
import 'package:flutter_nav_2/model/nav/router_delegate.dart';

void main() {
  runApp( App() );
}

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App> {
  NavRouterDelegate          _navRouterDelegate         = NavRouterDelegate();
  NavRouteInformationParser  _navRouteInformationParser = NavRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Navigation 2.0 Example',
      routerDelegate: _navRouterDelegate,
      debugShowCheckedModeBanner: false,
      routeInformationParser: _navRouteInformationParser,
    );
  }
}





