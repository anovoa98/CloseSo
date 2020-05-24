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
      length: 3,//numeros de tabs
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text("SoClose Aplication"),
          bottom: new TabBar(indicatorColor: Colors.red, tabs: <Widget>[
            new Tab(icon: new Icon(Icons.home),text: "Menu",),
            new Tab(icon: new Icon(Icons.person_outline),text: "Perfil",),
            new Tab(icon: new Icon(Icons.settings_applications),text: "Configuracion",)
            ]),
        ),
        body: new TabBarView(
          children: <Widget>[ 
            new InicioTabs(),
            new RegistroTabs(logoutCallback: logoutCallback,),
            new Acercade()
          ],
        )
      ),
    );
    return TabController;
  }
}