import 'package:flutter/material.dart';
 
class pessoal extends StatelessWidget {
  const pessoal({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }
 
  _body(BuildContext context) {
    return Center(
      child:Container(
      height: 300,
      width: 800,
      child: Image(
        fit: BoxFit.contain,
        image: NetworkImage('https://i.imgur.com/VIar7fg.jpeg')
      )
    ));
  }
}