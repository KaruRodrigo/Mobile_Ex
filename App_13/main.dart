import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home()
    );
  }
}

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return 
    DefaultTabController(
      length: 3,
      child:Scaffold(
        appBar: title(),
        body: body(),
    ));
  }

  title(){
    return AppBar(
      title:Text('Bottom Navigation Bar',
      style: TextStyle(fontSize: 20, color: Colors.white)),
      backgroundColor: Colors.purple,
      centerTitle: true,
      bottom: TabBar(tabs: [
        Tab(text: 'Pessoal'),
        Tab(text: 'Formação'),
        Tab(text: 'Experiência'),
      ],)
      );
  }

  body(){
    return TabBarView(
      children: [
        image(),
        image2(),
        image3(),
      ],
    );
  }

  image(){
    return 
    Center(child: Image(
      image: NetworkImage('https://i.imgur.com/zXy8Ht7.png'),
      fit: BoxFit.cover
      ));
  }
  
  image2(){
    return 
    Center(child: Image(
      image: NetworkImage('https://lh3.googleusercontent.com/proxy/GSIaOSr6ViXQ5nOY4Lsuz5QyMf7uFKer0mrVrkPzJiPiLAzjx6vymcsqL3SywIk553EwL2NK-Q90fAQ1iYzCw4XdI8VuVwq8xvlUeb0TeJJtkvoiGuW1kkkHPpgIjlgGNlQHCYtJ-73Qg5A47V5rrw'),
      fit: BoxFit.cover
      ));
  }
  
  image3(){
    return 
    Center(child: Image(
      image: NetworkImage('https://cdn-icons-png.flaticon.com/512/2303/2303952.png'),
      fit: BoxFit.cover
      ));
  }
}