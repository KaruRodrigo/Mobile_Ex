
import 'api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Film> films = [];

  getAllFilms() async {
    var api = Api();
    List<Film> newfilms = await api.listFilms();

    setState(() {
      films = newfilms;
    });
  }

  @override
  void initState() {
    getAllFilms();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App de Filmes"),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      backgroundColor: Colors.white,
      body: _corpo(),
    );
  }

  _corpo() {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: films.length,
      itemBuilder: (BuildContext context, int index) {
        Film film = films[index];

        return ListTile(
          title: Text(film.nome),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(film.foto),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Details(film: film,)),
            ).then((value) => getAllFilms());
          },
        );
      },
    );
  }
}

class Film {
  final int id;
  final String nome;
  final String sinopse;
  final String foto;

  Film(this.id, this.nome, this.sinopse, this.foto);
}
class Details extends StatelessWidget {
  const Details({Key? key, required this.film}) : super(key: key);

  final Film film;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App de Filmes"),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      backgroundColor: Colors.white,
      body: _corpo(),
    );
  }

  _corpo() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          Text("${film.nome} - Sinopse", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          SizedBox(height: 20,),
          Text(film.sinopse, style: TextStyle(fontSize: 18), textAlign: TextAlign.justify,),
        ],
      ),
    );
  }
}