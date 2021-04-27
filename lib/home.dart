import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  final uid;
  Home({Key key, this.uid}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  dynamic username;
  Future<String> getUser(String id) async {
    String name;
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(id)
        .get()
        .then((document) => (name = document["username"]));
    return name;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getUser(widget.uid),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Scaffold(
              body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Center(child: Text('Hello ${snapshot.data}')),
                RaisedButton(
                    onPressed: () {
                      context.read<AuthService>().signOut();
                    },
                    child: Text("Sign Out"))
              ]));
        }
      },
    );
  }
}
