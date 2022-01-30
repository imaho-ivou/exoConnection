import 'package:connection/Form/component/creecompte.dart';
import 'package:connection/Form/component/input.dart';
import 'package:connection/view/bienvenue.dart';
import 'package:connection/view/mdpOublier.dart';
import 'package:connection/view/pageCreeCompte.dart';
import 'package:flutter/material.dart';

TextEditingController controller_username = TextEditingController();
TextEditingController controller_passord = TextEditingController();
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Login(),
      ),
    );
  }
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  login() {
    String nomlogin = controller_username.text;
    String mdpLogin = controller_passord.text;
    String User = 'a';
    String mdp = 'a';
    if ((nomlogin.toString() == User) && (mdpLogin.toString() == mdp)) {
      controller_passord.text = '';
      controller_username.text = '';

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => bienvenue()),
      );
    } else {
      print(nomlogin);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                width: 300,
                height: 300,
                image: AssetImage('image/logo.png'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: input('Identifiant', Icons.person, controller_username),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: input('Mot de passe', Icons.vpn_key, controller_passord),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => mdpOublier(),
                      ),
                    );
                  },
                  child: Text('Mot de passe oublié ?'),
                ),
              ),
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
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(color: Colors.blueAccent),
                        ),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        login();
                      }
                    },
                    child: const Text(
                      'Se connecter',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
              CreeCompte('Créer un', 'Compte?', PageCreeCompte()),
            ],
          ),
        ),
      ),
    );
  }
}
