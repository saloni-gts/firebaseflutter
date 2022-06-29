import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import './home.dart';

class Streambld extends StatefulWidget {
  const Streambld({Key? key}) : super(key: key);

  @override
  State<Streambld> createState() => _StreambldState();
}

class _StreambldState extends State<Streambld> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("stream builder"),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: _streamdata(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return CircularProgressIndicator();
              case ConnectionState.active:
              case ConnectionState.done:
                {
                  return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(snapshot.data!.docs[index]['name']),
                        );
                      });
                }
              default:
                {
                  return SizedBox();
                }
            }
          },
        ));
  }

  Stream<QuerySnapshot> _streamdata() {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final CollectionReference _mainCollection = _firestore.collection('item');
    return _mainCollection.snapshots();
  }
}
