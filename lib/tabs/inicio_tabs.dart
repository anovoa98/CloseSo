import 'package:flutter/material.dart';
import 'package:login/buscar_amigos.dart';
import 'package:login/tabs/resgistro_tabs.dart';

class InicioTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[ 
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: RaisedButton(
                        color: Colors.blue,
                        shape: new RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)
                        ),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => buscar_amigos()),                                   
                            );
                        },
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: Center(
                            child: Text("Buscar Amigos", textAlign: TextAlign.center,),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: RaisedButton(
                        color: Colors.blue,
                        shape: new RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)
                        ),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => RegistroTabs()),                                   
                            );
                        },
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: Center(
                            child: Text("Favoritos", textAlign: TextAlign.center,),
                          ),
                        ),
                      ),
                    )
                  ],
                ), 
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: RaisedButton(
                        color: Colors.blue,
                        shape: new RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)
                        ),
                        onPressed: (){},
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: Center(
                            child: Text("Añadir amigos", textAlign: TextAlign.center,),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: RaisedButton(
                        color: Colors.blue,
                        shape: new RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)
                        ),
                        onPressed: (){},
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: Center(
                            child: Text("Chats", textAlign: TextAlign.center,),
                          ),
                        ),
                      ),
                    )
                  ],
                ), 
              ],
            )
          ],
        ),
      ) 
    );  





      /*
      body: new Stack(
        children: <Widget>[

          
          //agregamos una imagen
         
          /*
          new Container(
            margin: const EdgeInsets.all(10.0),//agregmos margenes
            width: 350.0,//ancho de la imagen
            height: 350.0,//largo de la imagen
            decoration: new BoxDecoration(
              image: new DecorationImage(image: new AssetImage("assets/images/logoU.png"),
              fit: BoxFit.cover
              ),
            ),
          ),
          //agragamos un boton con alguna acción
          new Container(
            margin: const EdgeInsets.only(top: 390.0, left: 25.0),
            child: new RaisedButton(
              padding: const EdgeInsets.only(top: 20, left: 100, right: 100, bottom: 20),
              textColor: Colors.white,
              color: Colors.grey,
              onPressed: (){//click del boton cuando lo presionamos
                Scaffold
                .of(context)
                .showSnackBar(SnackBar(content: Text('Hola Mundo')));
              },
              child: new Text("Presiona Aquí"),
            )
          )
          */
        ],
      )*/
    
  }
}
