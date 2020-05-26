import 'package:flutter/material.dart';
import 'package:login/tabs/lugares_tabs.dart';
import 'package:login/tabs/resgistro_tabs.dart';
import 'package:login/buscar_amigos.dart';
import 'package:login/listado_amigos.dart';
import 'package:login/flutter_speed_dial.dart';
import 'package:flip_card/flip_card.dart';
import 'package:login/chat/View/ChatListPageView.dart';

class InicioTabs extends StatelessWidget {
  bool _dialVisible = true;

   _renderBg() {
    return Container(
      decoration: BoxDecoration(color: const Color(0xFFFFFFFF)),
    );
  }

  _renderAppBar(context) {
    return MediaQuery.removePadding(
      context: context,
      removeBottom: true,
      child: AppBar(
        brightness: Brightness.dark,
        elevation: 0.0,
        backgroundColor: Color(0x00FFFFFF),
      ),
    );
  }

  _renderContent(context) {
    return Card(
      elevation: 0.0,
      margin: EdgeInsets.only(left: 32.0, right: 32.0, top: 20.0, bottom: 0.0),
      color: Color(0x00000000),
      child: FlipCard(
        direction: FlipDirection.HORIZONTAL,
        speed: 1000,
        onFlipDone: (status) {
          print(status);
        },
        front: Container(
          decoration: BoxDecoration(
            color: Color(0xFF006666),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Front', style: Theme.of(context).textTheme.headline),
              Text('Click here to flip back',
                  style: Theme.of(context).textTheme.body1),
            ],
          ),
        ),
        back: Container(
          decoration: BoxDecoration(
            color: Color(0xFF006666),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Back', style: Theme.of(context).textTheme.headline),
              Text('Click here to flip front',
                  style: Theme.of(context).textTheme.body1),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          _renderBg(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _renderAppBar(context),
              Expanded(
                flex: 4,
                child: _renderContent(context),
              ),
              Expanded(
                flex: 1,
                child: Container(),
              ),
            ],
          )
        ],
      ),
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
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BuscarAmigosPage()))),
          SpeedDialChild(
              child: Icon(Icons.favorite),
              backgroundColor: Colors.blue,
              label: 'Favorites',
              labelStyle: TextStyle(fontWeight: FontWeight.w500),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AmigosFavoritos()))),
          SpeedDialChild(
            child: Icon(Icons.chat_bubble_outline),
            backgroundColor: Colors.green,
            label: 'Chats',
            labelStyle: TextStyle(fontWeight: FontWeight.w500),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => ChatListPageView())),
          ),
        ],
      ),
    );
  }
}
