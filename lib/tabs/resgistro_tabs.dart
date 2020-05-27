import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class RegistroTabs extends StatefulWidget {
  RegistroTabs({@required this.userId, this.logoutCallback});
  final dynamic logoutCallback;
  final String userId;
  @override
  _RegistroTabsState createState() => _RegistroTabsState();
}

class _RegistroTabsState extends State<RegistroTabs> {
  File _image;
  Widget _greenColor() {
    return Positioned(
      top: 0,
      child: Container(
        color: Colors.white,
        height: 250,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }

  Future getImage(bool state) async {
    var image;
    if (state) {
      image = await ImagePicker.pickImage(source: ImageSource.camera);
    } else {
      image = await ImagePicker.pickImage(source: ImageSource.gallery);
    }

    setState(() {
      _image = image;
      print('Image Path $_image');
    });
  }

  Widget _userInfo() {
    Future<String> getUser = Future.delayed(
        Duration(seconds: 5),
        () => Firestore.instance
            .collection('users')
            .document(widget.userId.toString())
            .get()
            .then((value) =>
                value['name'] +
                ";" +
                value['lastName'] +
                ";" +
                value['email']));

    return Positioned(
      child: Container(
          margin: const EdgeInsets.all(20),
          height: 500,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(20),
          ),
          child: FutureBuilder(
              future: getUser,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return Container(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "User information: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                            padding: EdgeInsets.only(top: 60.0),
                            child: IconButton(
                              icon: Icon(
                                FontAwesomeIcons.edit,
                                size: 30.0,
                              ),
                              onPressed: () {
                                getImage(false);
                              },
                            ),
                          ),
                          CircleAvatar(
                            radius: 60,
                            backgroundColor: Color(0xff476cfb),
                            child: ClipOval(
                              child: new SizedBox(
                                width: 90.0,
                                height: 90.0,
                                child: (_image != null)
                                    ? Image.file(
                                        _image,
                                        fit: BoxFit.fill,
                                      )
                                    : Image.network(
                                        "https://www.softzone.es/app/uploads/2018/04/guest.png",
                                        fit: BoxFit.fill,
                                      ),
                            )),
                            ),
                            ]),
                          SizedBox(
                            width: 200,
                          ),
                          Text(snapshot.data.toString().split(";")[0]+"  "+snapshot.data.toString().split(";")[1]),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Email: ${snapshot.data.toString().split(';')[2]}",
                          style: TextStyle(fontSize: 20)),
                    ],
                  ),
                );
              })),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
            ),
            _greenColor(),
            //_appBar(),
            _userInfo(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          foregroundColor: Colors.blue,
          child: Icon(Icons.power_settings_new),
          onPressed: () => {widget.logoutCallback()}),
    );
  }
}
