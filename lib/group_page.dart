import 'package:flutter/material.dart';
import 'package:mobilebgs/styles.dart';

class GroupPage extends StatelessWidget {
  const GroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Group Data'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 30.0),
            Text(
              'Gega Rakanatha', style: TextStyles.title.copyWith(fontSize: 24.0),
              ),
            SizedBox(height: 8.0),
            Text(
              '123210136', style: TextStyles.body,
            ),
            SizedBox(height: 18.0),
            Text(
              'Timothea Ruth', style: TextStyles.title.copyWith(fontSize: 24.0),
            ),
            SizedBox(height: 8.0),
            Text(
              '123210121', style: TextStyles.body,
            )
          ],
        ),
      )
    );
  }
}
