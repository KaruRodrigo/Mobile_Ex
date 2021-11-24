import 'package:flutter/material.dart';
 
class experiencia extends StatelessWidget {
  const experiencia({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }
 
  _body(BuildContext context) {
    return Center(
      child:Container(
      height: 500,
      width: 500,
      child: Image(
        fit: BoxFit.contain,
        image: NetworkImage('https://cdn-icons-png.flaticon.com/512/2303/2303952.png')
      )
    ));
  }
}