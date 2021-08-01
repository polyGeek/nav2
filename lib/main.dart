import 'package:flutter/material.dart';
import 'package:flutter_nav_2/model/nav/book_route_information_parser.dart';
import 'package:flutter_nav_2/model/nav/book_router_delegate.dart';

void main() {
  runApp(BooksApp());
}

class BooksApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BooksAppState();
}

class _BooksAppState extends State<BooksApp> {
  BookRouterDelegate          _routerDelegate         = BookRouterDelegate();
  BookRouteInformationParser  _routeInformationParser = BookRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Books App',
      routerDelegate: _routerDelegate,
      debugShowCheckedModeBanner: false,
      routeInformationParser: _routeInformationParser,
    );
  }
}





