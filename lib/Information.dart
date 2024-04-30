import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobilebgs/styles.dart';

class Information extends StatelessWidget {
  const Information({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Help'),
        centerTitle: true,
        ),
    body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 18.0),
          Text(
            'Home', style: TextStyles.title.copyWith(fontSize: 24.0),
          ),
          SizedBox(height: 6.0),
          Text('Group Members', style: TextStyles.title.copyWith(fontSize: 19)),
          Text('Here you can see the members who create this application', style: TextStyles.body),
          Text('Primary Checker', style: TextStyles.title.copyWith(fontSize: 19)),
          Text('Input a number to check whether it is primary or not', style: TextStyles.body),
          Text('Triangle Calculator', style: TextStyles.title.copyWith(fontSize: 19)),
          Text('Input 3 numbers that are the side of the triangle. The results given would be the triangle area and its circumference', style: TextStyles.body),
          Text('Recommendation', style: TextStyles.title.copyWith(fontSize: 19)),
          Text('You can see some interesting cafe recommended by us here. Click to see the cafe detail and there is a star button beside each of the cafe listed to add the cafe to favorite.', style: TextStyles.body),
          Text('Favorite', style: TextStyles.title.copyWith(fontSize: 19)),
          Text('Here you can see the favorite cafe you add. You can click the star button to un-favorite it', style: TextStyles.body),


          SizedBox(height: 18.0),
          Text('Stopwatch', style: TextStyles.title.copyWith(fontSize: 24.0),),
          SizedBox(height: 6.0),
          Text('⁃	There are start and pause buttons on left side, click it to start/pause the stopwatch', style: TextStyles.body),
          Text('⁃	Lap button in the middle to mark the timestamp of each lap', style: TextStyles.body),
          Text('⁃	Reset on the right side to clear and restart the stopwatch', style: TextStyles.body),

          SizedBox(height: 18.0),
          Text('Help', style: TextStyles.title.copyWith(fontSize: 24.0),),
          SizedBox(height: 6.0),
          Text('Explanation of each menu in this application and how to use it', style: TextStyles.body)
        ],
      ),
    )
    );
  }
}
