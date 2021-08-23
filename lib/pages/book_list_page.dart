import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nav_2/model/nav/book.dart';
import 'package:flutter_nav_2/pages/home-drawer.dart';

class BooksListScreen extends StatelessWidget {
  final List<Book?> books;
  final ValueChanged<Book?> onTapped;
  final Function onSettings;

  BooksListScreen({
    required this.books,
    required this.onTapped,
    required this.onSettings
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        actions: [
          IconButton(
              onPressed: (){
                onSettings();
              },
              icon: Icon( Icons.settings )
          )
        ],
      ),
      drawer: HomeDrawer(),
      body: ListView(
        children: [
          for (var book in books)
            ListTile(
              title: Text( book!.title ),
              subtitle: Text( book.author ),
              onTap: () => onTapped( book ),
            )
        ],
      ),
    );
  }
}