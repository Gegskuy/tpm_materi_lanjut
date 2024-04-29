import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'recomendation_list.dart';
import 'package:url_launcher/url_launcher.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
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

  List<RecList> filteredList = [];
    for (int i = 0; i < userFav.length; i++) {
    filteredList.add(cafeList.where((item) => item.id == userFav[i]).first);
  }

    return SafeArea(
        child: Scaffold(
            body: Center(
              child: ListView.separated(
                itemBuilder: (context, index){
                  int state = userFav.contains(filteredList[index].id)? 1 : 0;
                  return Container(
                    child: Card(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(filteredList[index].name),
                              IconButton(
                                onPressed: (){
                                  setState(() {
                                    if (state == 1) {
                                      userFav.remove(filteredList[index].id);
                                    } else {
                                      userFav.add(filteredList[index].id);
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
                              _launchUrl(filteredList[index].link);
                            },
                            child: Text('More Info'),
                          )
                        ],
                      ),
                    ),
                  );
                },
                itemCount: filteredList.length,
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
