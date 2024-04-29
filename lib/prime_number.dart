import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'widget/custom_textfield.dart';
import 'styles.dart';

class PrimeNumberScreen extends StatefulWidget {
  @override
  _PrimeNumberScreenState createState() => _PrimeNumberScreenState();
}

class _PrimeNumberScreenState extends State<PrimeNumberScreen> {
  final userController = TextEditingController();
  bool _isPrime = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prime Number Checker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              controller: userController,
              hint: 'Input Number',
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.darkBlue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)
                  )
              ),
              onPressed: () {
                setState(() {
                  int? number = int.tryParse(userController.text);
                  _isPrime = isPrime(number!);
                });
              },
              child: Text(
                  'Check',
                style: TextStyles.title.copyWith(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Text(_isPrime ? 'Prime Number' : 'Not a Prime Number'),
          ],
        ),
      ),
    );
  }

  bool isPrime(int n) {
    if (n <= 1) return false;
    if (n <= 3) return true;

    if (n % 2 == 0 || n % 3 == 0) return false;

    for (int i = 5; i * i <= n; i += 6) {
      if (n % i == 0 || n % (i + 2) == 0) return false;
    }

    return true;
  }
}