import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeDrawer extends StatelessWidget {

  @override
  Widget build( BuildContext context ) {
    return FractionallySizedBox(
      widthFactor: 0.7,
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [

            SizedBox( height: 20 ),

            ElevatedButton(
                onPressed: (){
                  //_selectedBook = book;
                  //notifyListeners();
                },
                child: Text(
                  'Settings',
                  textAlign: TextAlign.center,
                )
            ),
          ],
        ),
      ),
    );
  }
}
