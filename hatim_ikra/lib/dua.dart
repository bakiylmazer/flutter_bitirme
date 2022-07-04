import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() => runApp(DuaPage());

class DuaPage extends StatefulWidget {
  DuaPage({Key? key}) : super(key: key);
  State<DuaPage> createState() => _DuaPageState();
}

class _DuaPageState extends State<DuaPage> {
  final _firestore = FirebaseFirestore.instance;
  var duaisim="Nazar Duası";
  var duaanlam="Her türlü şeytandan, zararlı şeylerden ve kem gözlerden bütün kelimeleri yüzü hürmetine Allah'a sığınırım.";
  var duaoku="Euzu bi kelimâtillâhi't-tâmmeti min kulli şeytanin ve hammetin ve min külli aynin lammeh.";


  Widget build(BuildContext context) {

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Dualar',
        home: Scaffold(
          body: ListView(
            padding: EdgeInsets.all(24),
            children: [
              SizedBox(height: 10),
              Text(
                duaisim,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Courgette',
                    fontSize: 30,
                    color: Color(0xff968952)),
              ),
              SizedBox(height: 30),
              Text(
                duaoku,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Courgette',
                    fontSize: 20,
                    color: Color(0xff968952)),
              ),
              SizedBox(height: 30),
              Text("Anlamı",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Courgette',
                      fontSize: 30,
                      color: Color(0xff968952))),
              SizedBox(height: 20),
              Text(
                duaanlam,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Courgette',
                    fontSize: 20,
                    color: Color(0xff968952)),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff968952),
                ),
                onPressed: () async {
                tiklama();
                },
                child: Text(
                  "Yeni Dua ",
                  style: TextStyle(
                    color: Color(0xff042d64),
                    fontSize: 20,
                    fontFamily: 'Courgette',
                  ),
                ),
              ),
            ],
          ),
          resizeToAvoidBottomInset: false,
          backgroundColor: Color(0xff042d64),
          appBar: AppBar(
            title: Text(
              "Dualar",
              style: TextStyle(
                  fontSize: 20,
                  color: Color(0xff968952),
                  fontFamily: 'Courgette'),
            ),
            backgroundColor: Color(0xff042d64),
          ),
        ));
  }

  Future<void> tiklama() async {
    CollectionReference duaRef = _firestore.collection('Yazilar');
    var a = Random().nextInt(8);
    var dua="dua";
    var dua1ref = duaRef.doc(dua+a.toString());
    var response= await dua1ref.get();
    dynamic veri=response.data();
    duaisim = veri['isim'];
    duaoku =veri['okunus'];
    duaanlam=veri['anlam'];
    setState(() {

    });

  }
}