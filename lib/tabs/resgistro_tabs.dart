import 'package:flutter/material.dart';

class RegistroTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    appBar: new AppBar(
      title: new Text('Registro Cliente'),
      actions: <Widget>[
        new IconButton(icon: const Icon(Icons.save),
        onPressed: (){},
        )
      ],
    );
    body: new Column(
      children: <Widget>[
        new ListTile(
          leading: const Icon(Icons.person),
          title: new TextField(
            decoration: new InputDecoration(
              hintText: "Nombre"
            ),
          ),
        ),
        new ListTile(
          leading: const Icon(Icons.phone),
          title: new TextField(
            decoration: new InputDecoration(
              hintText: "Telefono"
            ),
          ),
        ),
        new ListTile(
          leading: const Icon(Icons.email),
          title: new TextField(
            decoration: new InputDecoration(
              hintText: "Email"
            ),
          ),
        ),
        const Divider(
          height: 1.0,
        ),
        new ListTile(
          leading: const Icon(Icons.group),
          title: new Text('Cumpleaños'),
          subtitle: const Text('Marzo 17 de 2000'),
          ),
        new ListTile(
          leading: const Icon(Icons.group),
          title: new Text('Grupo Flutter'),
          subtitle: new Text('Flutter...'),
          ),
       ],
    );

    return Container(
      
    );
  }
}