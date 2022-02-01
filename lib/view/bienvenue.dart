import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class bienvenue extends StatefulWidget {
  const bienvenue({Key? key}) : super(key: key);

  @override
  _bienvenueState createState() => _bienvenueState();
}

class _bienvenueState extends State<bienvenue> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bienvenue  ${auth.currentUser?.displayName}',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            ElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();

                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => MyApp(),
                    ),
                  );
                },
                child: Text('Sign out'))
          ],
        ),
      ),
    );
  }
}
