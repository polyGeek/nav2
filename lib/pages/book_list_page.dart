import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nav_2/model/nav/book.dart';

class BooksListScreen extends StatelessWidget {
  final List<Book?> books;
  final ValueChanged<Book?> onTapped;

  BooksListScreen({
    required this.books,
    required this.onTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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