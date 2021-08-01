import 'package:flutter/widgets.dart';

class PageSettings extends StatelessWidget {

  @override
  Widget build( BuildContext context ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,

      children: [

        SizedBox( height: 20 ),

        Text( "Settings",
          textAlign: TextAlign.center,
        ),


      ],
    );
  }
}
