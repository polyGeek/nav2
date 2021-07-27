import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nav_2/model/nav/book.dart';

class BooksDetailsScreen extends StatelessWidget {
  final Book? book;

  BooksDetailsScreen({
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if ( book != null ) ...[
              Text( book!.title, style: Theme.of(context).textTheme.headline6 ),
              Text( book!.author, style: Theme.of(context).textTheme.subtitle1 ),
            ],
          ],
        ),
      ),
    );
  }
}