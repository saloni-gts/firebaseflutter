import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import './home.dart';


class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

  void initState() {

 _getdata();
    super.initState();
  }
  var lst=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "second screen"
        ),
      ),
      body:ListView.builder(
          itemCount: lst.length,
          itemBuilder: (BuildContext context ,int index){
          return ListTile(
          title:Text(lst[index]['name']),
          );
          }
      )
      );
  }
  Future<void> _getdata() async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final CollectionReference _mainCollection = _firestore.collection('item');
     var locvar= await _mainCollection.snapshots();
    locvar.listen((event) {
      lst=event.docs;
    });

  }
}


