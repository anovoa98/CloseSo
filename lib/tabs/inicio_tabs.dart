import 'package:flutter/material.dart';
import 'package:login/tabs/resgistro_tabs.dart';
import 'package:login/buscar_amigos.dart';
import 'package:login/listado_amigos.dart';
import 'package:login/flutter_speed_dial.dart';

class InicioTabs extends StatelessWidget {
  bool _dialVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.menu_close,
          animatedIconTheme: IconThemeData(size: 22.0),
          // this is ignored if animatedIcon is non null
          // child: Icon(Icons.add),
          visible: _dialVisible,
          curve: Curves.bounceIn,
          overlayColor: Colors.black,
          overlayOpacity: 0.5,
          onOpen: () => print('OPENING DIAL'),
          onClose: () => print('DIAL CLOSED'),
          tooltip: 'Speed Dial',
          heroTag: 'speed-dial-hero-tag',
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 8.0,
          shape: CircleBorder(),
          children: [
            SpeedDialChild(
              child: Icon(Icons.map),
              backgroundColor: Colors.red,
              label: 'Map',
              labelStyle: TextStyle(fontWeight: FontWeight.w500),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>BuscarAmigos()))
            ),
            SpeedDialChild(
              child: Icon(Icons.brush),
              backgroundColor: Colors.blue,
              label: 'Second',
              labelStyle: TextStyle(fontWeight: FontWeight.w500),
              onTap: () => print('SECOND CHILD'),
            ),
            SpeedDialChild(
              child: Icon(Icons.keyboard_voice),
              backgroundColor: Colors.green,
              label: 'Third',
              labelStyle: TextStyle(fontWeight: FontWeight.w500),
              onTap: () => print('THIRD CHILD'),
            ),
          ],
        ),
        );
  }
}
