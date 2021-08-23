import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PageSettings extends StatelessWidget {

  @override
  Widget build( BuildContext context ) {
    return Scaffold(
      appBar: AppBar(
      				title: Text( 'Settings' ),
      				centerTitle: true,
      			),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [

          SizedBox( height: 20 ),

          Text( "Settings",
            textAlign: TextAlign.center,
          ),


        ],
      ),
    );
  }
}
