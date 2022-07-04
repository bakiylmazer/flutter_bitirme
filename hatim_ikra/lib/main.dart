import 'package:flutter/material.dart';
import 'dua.dart';
import 'hatim.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:'Hatim-İkra',

      home: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Color(0xff042d64),
          appBar:
          AppBar(
            title: Text("Hatim-İkra",
              style: TextStyle(fontSize:20,color: Color(0xff968952),fontFamily: 'Courgette'),
            ),
            backgroundColor: Color(0xff042d64),
            ),
          body: Home()),

    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _Home(context);
  }
}

Widget _Home (BuildContext context)
{

  final hatimButton = Material(
    elevation: 5.0,
    borderRadius: BorderRadius.circular(30.0),
    color: Color(0xff968952),
    child: MaterialButton(
      minWidth: MediaQuery
          .of(context)
          .size
          .width,
      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>HatimPage()));
      },
      child: Text("HATİM",
        textAlign: TextAlign.center,
        style: TextStyle(color: Color(0xff042d64), fontFamily: 'Courgette'),),
    ),
  );


  final duaButton = Material(
    elevation: 5.0,
    borderRadius: BorderRadius.circular(30.0),
    color: Color(0xff968952),
    child: MaterialButton(
      minWidth: MediaQuery
          .of(context)
          .size
          .width,
      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>DuaPage()));
      },
      child: Text("DUALAR",
        textAlign: TextAlign.center,
        style: TextStyle(color: Color(0xff042d64), fontFamily: 'Courgette'),),
    ),
  );

  return Center(
    child: Container(
      child: Padding(
        padding: const EdgeInsets.all(36.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/images/Logo.png"),
            SizedBox(height: 15.0),
            hatimButton,

            SizedBox(height: 10.0),
            duaButton,
          ],
        ),
      ),
    ),
  );

}



