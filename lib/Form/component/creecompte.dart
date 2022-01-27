import 'package:flutter/material.dart';

class creeCompte extends StatelessWidget {
  const creeCompte({
    Key? key,
  }) : super(key: key);

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
          onPressed: () {},
          child: Text('Compte?'),
        ),
      ],
    );
  }
}
