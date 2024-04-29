import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'recomendation_list.dart';
import 'package:url_launcher/url_launcher.dart';

class Recomendation extends StatefulWidget {
  const Recomendation({super.key});

  @override
  State<Recomendation> createState() => _RecomendationState();
}

class _RecomendationState extends State<Recomendation> {
  final fav = GetStorage('fav');
  final session = GetStorage('session');
  late String username = session.read('username');
  late var userFav = fav.read(username);

  List<IconData> iconFavStyle = [
    Icons.star_border,
    Icons.star,
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Center(
            child: ListView.separated(
                itemBuilder: (context, index){
                  int state = userFav.contains(cafeList[index].id)? 1 : 0;
                  return Container(
                    child: Card(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(cafeList[index].name),
                              IconButton(
                                  onPressed: (){
                                    setState(() {
                                      if (state == 1) {
                                        userFav.remove(cafeList[index].id);
                                      } else {
                                        userFav.add(cafeList[index].id);
                                      }

                                      fav.write(username, userFav);
                                    });
                                  },
                                  icon: Icon(iconFavStyle[state]),
                                  iconSize: 24.0,
                              )
                            ],
                          ),
                          InkWell(
                            onTap: (){
                              _launchUrl(cafeList[index].link);
                            },
                            child: Text('More Info'),
                          )
                        ],
                      ),
                    ),
                  );
                },
                itemCount: cafeList.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 8.0,
                  );
                },
                ),
          )
      )
    );
  }

  Future<void> _launchUrl (String url) async {
    Uri parsedurl = Uri.parse(url);
    if(!await launchUrl(parsedurl)) {
      throw Exception("Could Not Launch Url");
  }
}
}
