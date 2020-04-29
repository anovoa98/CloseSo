import 'package:flutter/material.dart';
import 'package:login/tabs/acercade_tabs.dart';
import 'package:login/tabs/inicio_tabs.dart';
import 'package:login/tabs/lugares_tabs.dart';
import 'package:login/tabs/resgistro_tabs.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TabController = new DefaultTabController( 
      length: 4,//numeros de tabs
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text("Navegacion por tabs"),
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
            new RegistroTabs(),
            new Acercade()
          ],
        )
      ),
    );
    return new MaterialApp(
      title: 'Tabs con Flutter',
      theme: new ThemeData(
        primarySwatch: Colors.blue
      ),
      home: TabController,
      //nueva linea
      debugShowCheckedModeBanner: false,
    );
  }
}