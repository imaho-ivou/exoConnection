import 'package:connection/Form/component/input.dart';
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
        backgroundColor: Colors.grey,
        body: Login(),
      ),
    );
  }
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  login() {
    String nomlogin = controller_username.text;
    String mdpLogin = controller_passord.text;
    String resultat = nomlogin + ' ' + mdpLogin;

    print(resultat);
  }

  // void dispose() {
  //   // Clean up the controller when the widget is disposed.
  //   controller_username.dispose();
  //   controller_passord.dispose();
  //
  //   dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: input('Identifiant', Icons.person, controller_username),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child:
                      input('Mot de passe', Icons.vpn_key, controller_passord)),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Container(
                  width: 400,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      )),
                  child: ElevatedButton(
                    onPressed: () {
                      // Validate will return true if the form is valid, or false if
                      // the form is invalid.
                      if (_formKey.currentState!.validate()) {
                        login();
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
