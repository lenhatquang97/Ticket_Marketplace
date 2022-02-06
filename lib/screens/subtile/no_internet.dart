import 'package:flutter/material.dart';
import 'package:ticket_marketplace/screens/home_page.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'No Internet Connection',
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              child: const Text('Try Again'),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
