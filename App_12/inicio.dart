import 'package:flutter/material.dart';

class inicio extends StatelessWidget {
  const inicio({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child:Container(
      height: 500,
      width: 500,
      child: Image(
        fit: BoxFit.contain,
        image: NetworkImage('https://cdn-icons-png.flaticon.com/512/25/25694.png')
      )
    ));
  }
}