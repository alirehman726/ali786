import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:register/models/status_model.dart';

class UploadStatus extends StatefulWidget {
  @override
  _UploadStatusState createState() => _UploadStatusState();
}

class _UploadStatusState extends State<UploadStatus> {
  File _imageFile = null;

  bool _isLoading = false;

  TextEditingController _titleEditingController = TextEditingController();
  TextEditingController _messageEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Screen'),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    _imageFile == null
                        ? Text("No Image chosen")
                        : Image.file(
                            _imageFile,
                            height: 150,
                          ),
                    Container(
                      alignment: Alignment.center,
                      child: RaisedButton(
                        onPressed: () {
                          pickImage();
                        },
                        child: Text('Choose Image From Gallery'),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextField(
                      controller: _titleEditingController,
                      decoration: InputDecoration(
                        hintText: "Enter Title",
                        labelText: "Title",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextField(
                      controller: _messageEditingController,
                      minLines: 3,
                      maxLines: 10,
                      decoration: InputDecoration(
                        hintText: "Enter Message",
                        labelText: "Message",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      width: double.infinity,
                      child: RaisedButton(
                        textColor: Colors.white,
                        color: Colors.blue,
                        onPressed: () {
                          uploadImage();
                          uploadStatus();
                        },
                        child: Text('Upload Status'),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }

  Future pickImage() async {
    var file = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = file;
    });
  }

  uploadStatus() async {
    setState(() {
      _isLoading = true;
    });
    var imageUpload = await uploadImage();
    StatusModel statusModel = new StatusModel();
    statusModel.imageURL = imageUpload.toString();
    statusModel.title = _titleEditingController.text;
    statusModel.message = _messageEditingController.text;

    String docId =
        Firestore.instance.collection("statuses").document().documentID;
    statusModel.docid = docId;

    await Firestore.instance
        .collection("Statuses")
        .document(statusModel.docid)
        .setData(statusModel.toMap());

    Fluttertoast.showToast(msg: "Status Uploaded");
    Navigator.pop(context);

    setState(() {
      _isLoading = false;
    });
  }

  Future<dynamic> uploadImage() async {
    // setState(() {
    //   _isLoading = true;
    // });
    StorageReference storageReference =
        await FirebaseStorage().ref().child("statuses");

    StorageUploadTask storageUploadTask = await storageReference
        .child("stat_" + DateTime.now().toIso8601String())
        .putFile(_imageFile);

    StorageTaskSnapshot snapshot = await storageUploadTask.onComplete;

    var downloadURL = snapshot.ref.getDownloadURL();
    Fluttertoast.showToast(msg: "Image Uploaded");
    print("downloadURL $downloadURL");
    // setState(() {
    //   _isLoading = false;
    // });
    return downloadURL;
  }
}
