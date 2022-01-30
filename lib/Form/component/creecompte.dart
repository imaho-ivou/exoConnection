import 'package:flutter/material.dart';

class CreeCompte extends StatelessWidget {
  final String text;
  final String textBouton;
  final redirection;
  CreeCompte(this.text, this.textBouton, this.redirection);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => redirection,
              ),
            );
          },
          child: Text(textBouton),
        ),
      ],
    );
  }
}
