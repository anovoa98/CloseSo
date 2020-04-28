import 'package:flutter/material.dart';

class RegistroTabs extends StatefulWidget {
  @override
  _RegistroTabsState createState() => _RegistroTabsState();
}

class _RegistroTabsState extends State<RegistroTabs> {
  //Create green color
  Widget _greenColor() {
    return Positioned(
      top: 0,
      child: Container(
        color: Colors.green,
        height: 250,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }

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
                color: Colors.white,
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
                  color: Colors.white),
            ),
            SizedBox(
              width: 100,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.add_shopping_cart,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }

//Create your owner info
  Widget _userInfo() {
    return Positioned(
      top: 100,
      child: Container(
        margin: const EdgeInsets.all(20),
        height: 260,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          color: Colors.white,
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
                    radius: 60,
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
      top: 380,
      child: Container(
        margin: EdgeInsets.all(20),
        height: 200,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
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
              color: Colors.blueAccent,
            ),
            _greenColor(),
            _appBar(),
            _userInfo(),
            _userAddres(),
          ],
        ),
      ),
    );
  }
}
