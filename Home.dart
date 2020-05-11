import 'package:flutter/material.dart';
import 'package:youtubefluttercloneapp/Pesquisa.dart';
import 'package:youtubefluttercloneapp/telas/Biblioteca.dart';
import 'package:youtubefluttercloneapp/telas/EmAlta.dart';
import 'package:youtubefluttercloneapp/telas/Inicio.dart';
import 'package:youtubefluttercloneapp/telas/Inscricoes.dart';

class Home extends StatefulWidget {



  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int valorAba=0;
  String resultado='';

  @override
  Widget build(BuildContext context) {


    List<Widget> abaSelecionada=[
      Inicio(resultado),
      EmAlta(),
      Inscricoes(),
      Biblioteca()
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.grey),
        title: Image.asset('imagens/youtube.png', width: 98, height: 22,),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.videocam),
              onPressed: (){}
          ),
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () async {
               String res = await showSearch(context: context, delegate: Pesquisa());
               setState(() {
                 resultado= res;
               });
               print('resultado ' + res);
              }
          ),
          IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: (){}
          ),

        ],
      ) ,
        body: Container(
          padding: EdgeInsets.only(top: 16),
          child: abaSelecionada[valorAba],
        ),

        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            fixedColor: Colors.red,
            currentIndex: valorAba,
            onTap: (index){
              setState(() {
                valorAba=index;
              });
            },
            items: [
              BottomNavigationBarItem(
                  title: Text('Inicio'),
                  icon: Icon(Icons.home)
              ),
              BottomNavigationBarItem(
                  title: Text('Em Alta'),
                  icon: Icon(Icons.whatshot)
              ),
              BottomNavigationBarItem(
                  title: Text('Inscrições'),
                  icon: Icon(Icons.subscriptions)
              ),
              BottomNavigationBarItem(
                  title: Text('Biblioteca'),
                  icon: Icon(Icons.folder)
              )
            ]
        ),
    );
  }
}
