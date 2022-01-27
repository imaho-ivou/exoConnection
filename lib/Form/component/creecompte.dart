import 'package:connection/view/pageCreeCompte.dart';
import 'package:flutter/material.dart';

class CreeCompte extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Créer un',
          style: TextStyle(color: Colors.white),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PageCreeCompte(),
              ),
            );
          },
          child: Text('Compte?'),
        ),
      ],
    );
  }
}
