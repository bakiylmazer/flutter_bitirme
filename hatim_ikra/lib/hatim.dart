import 'package:flutter/material.dart';
import 'package:hatim_ikra/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class HatimPage extends StatefulWidget {
  const HatimPage({Key? key}) : super(key: key);

  @override
  State<HatimPage> createState() => _HatimPageState();
}

class _HatimPageState extends State<HatimPage> {
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  TextEditingController t3 = TextEditingController();
  var gelencuz = "";
  var gelensira = "";
  var gelenhatim = "";
  yaziEkle() {
    FirebaseFirestore.instance.collection(t1.text).doc(t2.text).set({
      t2.text: t2.text + ".Cüz- " + t3.text,
    });
    gelensira = "";
    for (int i = 1; i <= 30; i++) {
      FirebaseFirestore.instance
          .collection(t1.text)
          .doc(i.toString())
          .get()
          .then((gelenVeri) {
        setState(() {
          gelencuz = gelenVeri.data()![i.toString()];
          gelensira = gelensira + gelencuz + "\n";
        });
      });
    }
  }

  bool gosterbuton = true;
  bool eklebuton = false;
  int a = 0;
  yaziGoster() {
    if (t1.text != "") {
      for (int i = 1; i <= 30; i++) {
        FirebaseFirestore.instance
            .collection(t1.text)
            .doc(i.toString())
            .get()
            .then((gelenVeri) {
          setState(() {
            gelencuz = gelenVeri.data()![i.toString()];
            gelensira = gelensira + gelencuz + "\n";
          });
        });
      }
      gosterbuton = false;
      eklebuton = true;
    }
  }

  temizle() {
    gelensira = "";
    t1.text = "";
    t2.text = "";
    t3.text = "";
    gosterbuton = true;
    eklebuton=false;
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hatim',
      home: Scaffold(
          backgroundColor: Color(0xff042d64),
          body: ListView(
            padding: EdgeInsets.all(24),
            children: [
              SizedBox(height: 10),
              TextField(
                enabled: gosterbuton,
                decoration:
                    InputDecoration(labelText: 'Hatim Numarası Giriniz.(1-3)'),
                keyboardType: TextInputType.number,
                style: TextStyle(color: Color(0xff968952)),
                controller: t1,
              ),
              SizedBox(height: 10),
              TextField(
                enabled: eklebuton,
                decoration: InputDecoration(
                    labelText: 'Cüz Numarasınız Giriniz.(1-30)'),
                keyboardType: TextInputType.number,
                style: TextStyle(color: Color(0xff968952)),
                controller: t2,
              ),
              SizedBox(height: 10),
              TextField(
                enabled: eklebuton,
                decoration: InputDecoration(
                    labelText: 'Adınızı Ve Soyadınızı Giriniz.'),
                style: TextStyle(color: Color(0xff968952)),
                controller: t3,
              ),
              Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Color(0xff968952)),
                    child: Text(
                      "Göster",
                      style: TextStyle(
                          color: Color(0xff042d64),
                          fontFamily: 'Courgette',
                          fontSize: 20),
                    ),
                    onPressed: gosterbuton
                        ? () {
                            setState(() {
                              yaziGoster();
                            });
                          }
                        : null,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Color(0xff968952)),
                    child: Text(
                      "Ekle",
                      style: TextStyle(
                        color: Color(0xff042d64),
                        fontFamily: 'Courgette',
                        fontSize: 20,
                      ),
                    ),
                    onPressed: eklebuton
                        ? () {
                            setState(() {
                              yaziEkle();
                            });
                          }
                        : null,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Color(0xff968952)),
                      child: Text(
                        "Temizle",
                        style: TextStyle(
                            color: Color(0xff042d64),
                            fontFamily: 'Courgette',
                            fontSize: 20),
                      ),
                  onPressed: eklebuton?(){
                        setState(() {
                          temizle();
                        });
                  }:null,)
                ],
              ),
              Text(
                gelensira,
                style: TextStyle(
                  fontSize: 20,
                ),
              )
            ],
          ),
          appBar: AppBar(
            title: Text(
              "Hatim",
              style: TextStyle(
                  color: Color(0xff968952),
                  fontSize: 20,
                  fontFamily: 'Courgette'),
            ),
            backgroundColor: Color(0xff042d64),
          )),
    );
  }
}
