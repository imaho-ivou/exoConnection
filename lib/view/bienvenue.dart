import 'package:flutter/material.dart';

import '../main.dart';

class bienvenue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('bonjour $User'),
      ),
    );
  }
}
