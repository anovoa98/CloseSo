import 'package:flutter/material.dart';
//aquí es la pagina del perfil
//necesario traer perfil e info directamente de la base de datos de firebase
class RegistroTabs extends StatefulWidget {
  RegistroTabs({this.logoutCallback});
  final dynamic logoutCallback;
  @override
  _RegistroTabsState createState() => _RegistroTabsState();
}

class _RegistroTabsState extends State<RegistroTabs> {
  //Create green color
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
/*
  //Create back button
  Widget _appBar() {
    return Positioned(
      top: 20,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
            SizedBox(
              width: 100,
            ),
            Text(
              "Profile",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(
              width: 100,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.playlist_add_check,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
*/
//Create your owner info
  Widget _userInfo() {
    return Positioned(
      
      child: Container(
        margin: const EdgeInsets.all(20),
        height: 260,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "User information: ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    child: const Image(
                      image: NetworkImage(
                          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                    ),
                    radius: 50,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text("First Name"),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Last Name"),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text("Email: probando@gmail.com", style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }

  //User addres
  Widget _userAddres() {
    return Positioned(
      top: 300,
      child: Container(
        margin: EdgeInsets.all(20),
        height: 200,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(20)),
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Usser Address: ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Text("Village: " + "Nongnoia village"),
              SizedBox(
                height: 20,
              ),
              Text("District: " + "Sikhottabong district"),
              SizedBox(
                height: 20,
              ),
              Text("Province: " + "Vientiane capital"),
            ],
          ),
        ),
      ),
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
            _userAddres(),
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
