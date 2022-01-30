import 'package:connection/Form/component/creecompte.dart';
import 'package:connection/Form/component/input.dart';
import 'package:flutter/material.dart';

import '../main.dart';

TextEditingController controller_userMailOublier = TextEditingController();

class mdpOublier extends StatefulWidget {
  @override
  _mdpOublierState createState() => _mdpOublierState();
}

class _mdpOublierState extends State<mdpOublier> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 500,
                  height: 70,
                  child: Text(
                    'Veuillez entrer votre adresse e-mail '
                    'pour rechercher votre compte.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                input('Adresse e-mail', Icons.mail, controller_userMailOublier),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        width: 250,
                        height: 50,
                        decoration: BoxDecoration(),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                side: BorderSide(color: Colors.blueAccent),
                              ),
                            ),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {}
                          },
                          child: Text(
                            "Reinitialiser",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    CreeCompte('', 'Retour', MyApp()),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
