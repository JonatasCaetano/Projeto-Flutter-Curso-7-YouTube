import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:youtubefluttercloneapp/modelos/video.dart';
import '../Api.dart';

class Inicio extends StatefulWidget {

  String pesquisa;
  Inicio(this.pesquisa);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {

  _carregarLista(String pesquisa){
    Api api = Api();
    return api.pesquisar(pesquisa);
  }

  @override
  Widget build(BuildContext context) {



    return FutureBuilder<List<Video>>(
        future: _carregarLista(widget.pesquisa),
        builder: (context, snapshot){
          switch(snapshot.connectionState){
            case ConnectionState.none:
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
              break;
            case ConnectionState.done:
              if(snapshot.hasData){

              }else{

              }
              break;
          }

          return ListView.separated(
              itemBuilder: (context, index){

                List<Video> videos = snapshot.data;
                Video video = videos[index];

                return GestureDetector(
                  onTap: (){
                    FlutterYoutube.playYoutubeVideoById(
                        apiKey: CHAVE_YOUTUBE_API,
                        videoId: video.id,
                        autoPlay: true,
                        fullScreen: true,
                        appBarColor: Colors.black
                    );
                  },
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(video.imagem)
                            )
                        ),
                      ),
                      ListTile(
                        title: Padding(padding: EdgeInsets.only(top: 4,),
                          child: Text(video.titulo),) ,
                        subtitle: Padding(padding: EdgeInsets.only(bottom: 16, left: 16),
                          child: Text(video.canal),),
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index)=> Divider(
                height: 2,
                color: Colors.grey,
              ),
              itemCount: snapshot.data.length
          );
        }
    );
  }
}
