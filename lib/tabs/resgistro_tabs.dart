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
        color: Color(0xFFD7CCC8),
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
          height: 300,
          width: MediaQuery.of(context).size.width * 2.0,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(20),
          ),
          child: FutureBuilder(
              future: getUser,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                Widget widget;
                Widget widget2;
                if(snapshot.hasData){
                  widget = Text(
                            (snapshot.data.toString().split(";")[0] +
                                "  " +
                                snapshot.data.toString().split(";")[1]),
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          );
                  widget2 = Text("Email: ${snapshot.data.toString().split(';')[2]}",
                          style: TextStyle(fontSize: 20));
                }
                else{
                  widget = Text("Cargando información de usuario",
                          style: TextStyle(fontSize: 20));
                  widget2 = Text("Cargando información de usuario",
                          style: TextStyle(fontSize: 20));
                }
                return Container(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Información Usuario: ",
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
                                SizedBox(
                                      width: 30,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5.0),
                                  child: IconButton(
                                    icon: Icon(
                                      FontAwesomeIcons.edit,
                                      size: 20.0,
                                    ),
                                    onPressed: () {
                                      getImage(false);
                                    },
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    
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
                                    )
                                  ],
                                )
                              ]),
                          SizedBox(
                            width: 200,
                          ),
                          widget,
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      widget2
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
              color: Color(0xFFD7CCC8),
            ),
            _greenColor(),
            //_appBar(),
            _userInfo(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFFD7CCC8),
          foregroundColor: Colors.black,
          child: Icon(Icons.power_settings_new),
          onPressed: () => {widget.logoutCallback()}),
    );
  }
}
