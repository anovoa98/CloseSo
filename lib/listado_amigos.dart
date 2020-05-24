import 'package:dynamic_list_view/DynamicListView.dart';
import 'package:flutter/material.dart';
import 'dart:async';
//pagina listado de favoritos 

class AmigosFavoritos extends StatelessWidget
{
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listado de amigos'),
      ),
      body: ListView(
          children: List.generate(10, (index){
            return Center(
              child: Text(
                'Contacto # $index',
                style: Theme.of(context).textTheme.headline,
              ),
            );
          }

        ),
      ) 
    );
  }
}

/*

class ListaInfinita extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: DynamicListView.build(
            itemBuilder: _itemBuilder,
            dataRequester: _dataRequester,
            initRequester: _initRequester,
          ),
        ),
      ),
    );
  }
  Future<List> _initRequester() async {
    return Future.value(List.generate(15, (i) => i));
  }

  Future<List> _dataRequester() async {
    return Future.delayed(Duration(seconds: 2), () {
      return List.generate(10, (i) => 15 + i);
    });
  }

  Function _itemBuilder = (List dataList, BuildContext context, int index) {
    String title = dataList[index].toString();
    return ListTile(title: Text("Hola $title"));
  };
 
}   */