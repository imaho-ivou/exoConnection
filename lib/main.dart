import 'package:connection/Form/component/creecompte.dart';
import 'package:connection/Form/component/input.dart';
import 'package:connection/view/bienvenue.dart';
import 'package:connection/view/mdpOublier.dart';
import 'package:connection/view/register/fire_auth.dart';
import 'package:connection/view/register/pageCreeCompte.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth = FirebaseAuth.instance;

TextEditingController controller_username = TextEditingController();

TextEditingController controller_passord = TextEditingController();
String User = 'a';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
                  child: Text('Mot de passe oubli?? ?'),
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
                      //login();
                      if (_formKey.currentState!.validate()) {
                        FireAuth.registerUsingEmailPassword(
                            email: controller_username.text,
                            password: controller_passord.text,
                            method: auth.signInWithEmailAndPassword,
                            chemin: bienvenue(),
                            context: context);
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => bienvenue(),
                        //   ),
                        // );
                      }
                    },
                    child: const Text(
                      'Se connecter',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
              CreeCompte('Cr??er un', 'Compte?', PageCreeCompte()),
            ],
          ),
        ),
      ),
    );
  }
}
