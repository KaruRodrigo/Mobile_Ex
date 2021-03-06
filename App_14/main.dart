import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool nightMode = false;
  bool smtxt = false;

  double fsize = 25.0;

  Color varBlack = Colors.black;
  Color varWhite = Colors.white;

  @override
  void initState() { 
    super.initState();
    getSaved();
  }
 
  getSaved() async{
    SharedPreferences config = await SharedPreferences.getInstance();
    bool? nightValue = config.getBool("nKey");
    bool? sizeValue = config.getBool("sKey");
    if(nightValue != null && nightValue != nightMode){
    nightMode = nightValue;
    setState(() {
      nightBringer();
    });}
    if(sizeValue == true) fsize = 15;
    if(sizeValue == false) fsize = 25;
  }

  setSaved() async{
    SharedPreferences config = await SharedPreferences.getInstance();
    await config.setBool('nKey', nightMode);
    
    await config.setBool('sKey',smtxt);
    
  }


  nightBringer() {  
  setState(() {
    if(nightMode==false){
      varBlack = Colors.black;
      varWhite = Colors.white;
      }
    if(nightMode==true){
      varBlack = Colors.white54;
      varWhite = Colors.black87;
      }
      setSaved();
  });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: title(),
      body: body(),
    );
  }

  title(){
    return AppBar(
      title: Text('Frases', style: TextStyle(color: varWhite)),
      backgroundColor: Colors.purple,
    );
  }

  body(){
    return Container(
      color: varWhite,
      child: Column(
        children: <Widget>[
          pad(0,10,0,0),
          options(),
          pad(0,10,0,0),
          cont(),
        ],
      )
    );
  }

  options(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
      opTxt('Night Mode'),
      nswt(),
      pad(10,0,10,0),
      opTxt('Small Text'),
      tswt(),
      ],
    );
  }

  cont(){
    return Container(
          height: 400, width: 320,
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          decoration: BoxDecoration(
            border: Border.all(color: varBlack, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(5))),
          child: SingleChildScrollView(child:texto())  
          );
  }

  opTxt(txt){
    return Text(txt,
    style: TextStyle(
      fontSize: 17.5,
      fontWeight: FontWeight.bold,
      color: varBlack,
    ));
  }

  pad(double L, double T, double R, double B){
    return Padding(
      padding: EdgeInsets.fromLTRB(L, T, R, B)
    );
  }

  nswt(){
    return Switch(
      value: nightMode,
      onChanged: (value){
        setState(() {
          nightMode = value;
          nightBringer();
        });
      },
      activeTrackColor: Colors.purple[300],
      inactiveTrackColor: Colors.grey,
      activeColor: Colors.grey[200],
      inactiveThumbColor: Colors.grey[200],
    );
  }

  tswt(){
    return Switch(
      value: smtxt,
      onChanged: (value){
        setState(() {
          smtxt = value;

          if(smtxt == true){
            fsize = 15.0;
          }
          if(smtxt == false){
            fsize = 25.0;
          }
          setSaved();
        });
      },
      activeTrackColor: Colors.purple[300],
      inactiveTrackColor: Colors.grey,
      activeColor: Colors.grey[200],
      inactiveThumbColor: Colors.grey[200],
    );
  }

  texto(){
    return Text(
      "Texto de Teste",
      style: TextStyle(fontSize: fsize, color: varBlack));
  }
}