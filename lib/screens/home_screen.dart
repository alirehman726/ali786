import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:register/screens/login_screen.dart';
import 'package:register/screens/upload_status.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoggedIn = false;
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['Email']);
  @override
  void initState() {
    super.initState();

    FirebaseAuth.instance.onAuthStateChanged.listen((firebaseuser) {
      if (firebaseuser == null) {
        // user not logged in

        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => LoginScreen()),
            (Route<dynamic> rr) => false);
      }
    });
  }

  _logout() {
    _googleSignIn.signOut();
    setState(() {
      _isLoggedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
            ),
            onPressed: () {
              FirebaseAuth.instance.signOut().then((onValue) {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => LoginScreen()));
              });
              _logout();
            },
          ),
        ],
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection("Statuses").snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          if (snapshot.data.documents.length == 0) {
            return Text("No Data");
          }
          return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.network(
                      snapshot.data.documents[index].data["imageURL"]),
                  title: Text(snapshot.data.documents[index].data["title"]),
                  subtitle:
                      Text(snapshot.data.documents[index].data["message"]),
                );
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UploadStatus(),
            ),
          );
        },
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}
