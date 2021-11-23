import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: title(),
      backgroundColor: Colors.white,
      body: body(),
    );
  }

  title() {
    return AppBar(
      title: Text(
        'Anuncios',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
      centerTitle: true,
      backgroundColor: Colors.purple,
    );
  }

  body() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          carousel(),
        ],
      ),
    );
  }

  image(link) {
    return Image.network(
      link,
      width: 200,
      height: 200,

    );
  }

  carousel() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 50, 0, 20),
      height: 400,
      child: ListView(
        children: <Widget>[
          pading(
              containerAd(
                  image(
                      'https://media.discordapp.net/attachments/877638537896394782/912786277844271154/unknown.png'),
                  container(
                      pading(text('Oculos Escuros ', 30.0, Colors.white), 0, 10,
                          0, 0),
                      pading(available(), 0, 10, 0, 0))),
              30,
              0,
              0,
              30),
          pading(
              containerAd(
                  image(
                      'https://media.discordapp.net/attachments/877638537896394782/912794355159429210/unknown.png'),
                  container(
                      pading(text('Chapeu de Palha', 30.0, Colors.white), 0, 10,
                          0, 0),
                      pading(available(), 0, 10, 0, 0))),
              30,
              0,
              0,
              30),
          pading(
              containerAd(
                  image(
                      'https://media.discordapp.net/attachments/877638537896394782/912795846997839943/unknown.png'),
                  container(
                      pading(text('PC Gamer', 30.0, Colors.white), 0, 10,
                          0, 0),
                      pading(available(), 0, 10, 0, 0))),
              30,
              0,
              0,
              30),
          pading(
              containerAd(
                  image(
                      'https://media.discordapp.net/attachments/877638537896394782/912796553654181938/unknown.png'),
                  container(
                      pading(
                          text('CD de Pagode', 30.0, Colors.white), 0, 10, 0, 0),
                      pading(available(), 0, 10, 0, 0))),
              30,
              0,
              0,
              30),
          pading(
              containerAd(
                  image(
                      'https://media.discordapp.net/attachments/877638537896394782/912798151306522704/unknown.png'),
                  container(
                      pading(text('Bebedouro', 30.0, Colors.white), 0,
                          10, 0, 0),
                      pading(unavailable(), 0, 10, 0, 0))),
              30,
              0,
              0,
              30),

        ],
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  containerAd(context, content) {
    return Container(
        height: 300,
        width: 300,
        color: Colors.grey,
        child: Column(children: <Widget>[
          Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0), child: context),
          content
        ]));
  }

  container(content, describe) {
    return Container(
      child: Column(
        children: <Widget>[content, describe],
      ),
    );
  }

  pading(content, double L, double T, double B, double R) {
    return Padding(padding: EdgeInsets.fromLTRB(L, T, R, B), child: content);
  }

  text(content, double size, color) {
    return Text(content, style: TextStyle(fontSize: size, color: color));
  }

  available() {
    return text('Disponivel', 30.0, Colors.lightGreenAccent);
  }

  unavailable() {
    return text('Indisponivel', 30.0, Colors.red);
  }
}