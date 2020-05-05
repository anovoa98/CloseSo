import 'package:flutter/material.dart';
import 'package:login/services/authentication.dart';
import 'package:login/tabs/acercade_tabs.dart';
import 'package:login/tabs/inicio_tabs.dart';
import 'package:login/tabs/lugares_tabs.dart';
import 'package:login/tabs/resgistro_tabs.dart';

class HomePage extends StatelessWidget {
  final String userId;
  final BaseAuth auth;
  final dynamic logoutCallback;
  HomePage({this.auth, this.logoutCallback, this.userId});

  @override
  Widget build(BuildContext context) {
    final TabController = new DefaultTabController( 
      length: 4,//numeros de tabs
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text("SoCloseAplications"),
          bottom: new TabBar(indicatorColor: Colors.red, tabs: <Widget>[
            new Tab(icon: new Icon(Icons.home),text: "Menu",),
            new Tab(icon: new Icon(Icons.contacts),text: "Chats",),
            new Tab(icon: new Icon(Icons.place),text: "Perfil",),
            new Tab(icon: new Icon(Icons.help),text: "Configuracion",)
            ]),
        ),
        body: new TabBarView(
          children: <Widget>[ 
            new InicioTabs(),
            new LugaresTabs(),
            new RegistroTabs(logoutCallback: logoutCallback,),
            new Acercade()
          ],
        )
      ),
    );
    return TabController;
  }
}