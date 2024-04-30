import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobilebgs/Information.dart';
import 'package:mobilebgs/group_page.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:mobilebgs/login_screen.dart';
import 'package:mobilebgs/prime_number.dart';
import 'package:mobilebgs/recomendation.dart';
import 'package:mobilebgs/stopwatch_screen.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobilebgs/triangle.dart';

import 'favorite.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var height, width;
  final user = GetStorage();
  final session = GetStorage('session');

  List imgData = [
    "assets/images/tim.png",
    "assets/images/primaa.jpg",
    "assets/images/segitiga.png",
    "assets/images/lists.jpg",
    "assets/images/bintang.jpg",
  ];

  List dataTitle = [
    "Group Data",
    "Primary Checker",
    "Triangle Calculator",
    "Recomendation",
    "Favorite"
  ];

  int _selectedIndex = 0;
  late List<dynamic> bodyList = [
    _home(),
    StopwatchScreen(),
    Information(),
  ];

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
            child: Text("Log Out"),
          onTap: () {
              session.write('isLogin', false);
              session.write('username', '');

              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                return LoginScreen();
              }));
          },
        ),
      ),
      body: bodyList[_selectedIndex],
      bottomNavigationBar: GNav(
        gap: 8,
        backgroundColor: Colors.black,
        color: Colors.white,
        activeColor: Colors.white,
        tabBackgroundColor: Colors.blueGrey.shade900,
        padding: EdgeInsets.all(16),
        tabs: const[
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
              icon: Icons.timer,
              text: 'Stopwatch',
          ),
          GButton(
              icon: Icons.info_outline,
              text: 'Help'
          ),
        ],
        selectedIndex: _selectedIndex,
        onTabChange: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }

  Widget _home() {
    return SingleChildScrollView(
      child: Container(
        color: Colors.indigo,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(),
              height: height * 0.20,
              width: width,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 70,
                      left: 15,
                      right: 15,
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Dashboard',
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)
                  ),
                ),
                // height: height,
                width: width,
                padding: EdgeInsets.only(bottom: 20),
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 1.3,
                      mainAxisSpacing: 25,
                    ),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: dataTitle.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){
                          if(index == 0){
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return GroupPage();
                            }));
                          }
                          else if(index == 1){
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return PrimeNumberScreen();
                            }));
                          }
                          else if(index == 2){
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return TriangleCalculator();
                            }));
                          }
                          else if(index == 3){
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return Recomendation();
                            }));
                          }
                          else if(index == 4){
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return Favorite();
                          }));
                          }
                          },
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                spreadRadius: 1,
                                blurRadius: 4,
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                imgData[index],
                                width: 200,
                              ),
                              Text(
                                dataTitle[index],
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
