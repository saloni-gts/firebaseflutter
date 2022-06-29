import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import './SecondPage.dart';
import 'package:firebase_core/firebase_core.dart';
import './streambui.dart';

class HomePage extends StatefulWidget {


  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {

  TextEditingController str1=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "first page"
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: str1,
            ),
            TextButton(onPressed:(){
              _firebasedata();
            },
                child:Text(
                    "go  to second screen"
                ))
          ],
        ),
      ),
    );
  }
  void _firebasedata(){
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final CollectionReference _mainCollection = _firestore.collection('item');

    _mainCollection.add({"name":str1.text});

     Navigator.push(context,
        MaterialPageRoute(builder:
           (context)=>Streambld()));
  }
}

