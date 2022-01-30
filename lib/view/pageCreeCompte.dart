import 'package:connection/Form/component/creecompte.dart';
import 'package:connection/Form/component/input.dart';
import 'package:connection/main.dart';
import 'package:flutter/material.dart';

TextEditingController controller_userEmailInscription = TextEditingController();
TextEditingController controller_userIdentifiantInscription =
    TextEditingController();
TextEditingController controller_userPassewordInscription =
    TextEditingController();
TextEditingController controller_userConfPassewordInscription =
    TextEditingController();

class PageCreeCompte extends StatefulWidget {
  @override
  _PageCreeCompteState createState() => _PageCreeCompteState();
}

class _PageCreeCompteState extends State<PageCreeCompte> {
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
                input('Nom utilisateur', Icons.person,
                    controller_userIdentifiantInscription),
                input('Email', Icons.email, controller_userEmailInscription),
                input('Nouveau mot passe', Icons.password,
                    controller_userPassewordInscription),
                input('Confirmation mot passe', Icons.password,
                    controller_userConfPassewordInscription),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Container(
                    width: 400,
                    height: 50,
                    decoration: BoxDecoration(),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            side: BorderSide(color: Colors.blueAccent),
                          ),
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {}
                      },
                      child: const Text(
                        "S'inscrire",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                CreeCompte('Déjà un membre?', 'se connecter', MyApp())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
