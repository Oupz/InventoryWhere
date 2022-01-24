import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  final Function(int)? onChangedStep;

  AuthScreen({
    Key? key,
    this.onChangedStep,
  }) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  // Etat du formulaire
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final RegExp emailRegex = RegExp(r"[a-z0-9\._-]+@[a-z0-9\._-]+\.[a-z]+");

  late String _email = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          // Pousser le texte vers le haut
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: 30.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                      text: 'InventoryWhere\n',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 40.0,
                      ),
                      children: [
                        TextSpan(
                          text: 'Connectez-vous\n'.toUpperCase(),
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0,
                          ),
                        ),
                      ]),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Entrez votre email',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        onChanged: (value) => setState(() => _email = value),
                        validator: (value) =>
                            value!.isEmpty || !emailRegex.hasMatch(value)
                                ? 'Veuillez saisir un email valide'
                                : null,
                        decoration: InputDecoration(
                          hintText: 'Ex: johny.begood@oupz.com',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0.6),
                            borderSide: BorderSide(
                              color: Colors.blueGrey,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0.6),
                            borderSide: BorderSide(
                              color: Colors.blueGrey,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      RaisedButton(
                        onPressed: !emailRegex.hasMatch(_email)
                            ? null
                            : () {
                                if (_formKey.currentState!.validate()) {
                                  print(_email);
                                  widget.onChangedStep!(1);
                                }
                              },
                        child: Text(
                          'continue'.toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 15.0,
                        ),
                        elevation: 0.0,
                        color: Theme.of(context).primaryColor,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
