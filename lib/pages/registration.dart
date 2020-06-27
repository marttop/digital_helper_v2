import 'package:digital_helper_v2/utils/registration_widget.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  String errorMsg = '';
  Color txtColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Créer votre compte",
          style: Theme.of(context).textTheme.headline4,
        ),
        backgroundColor: Colors.black26,
        elevation: 0.0,
      ),
      body: Column(children: <Widget>[
        Expanded(
            child: ListView(
          children: <Widget>[
            Form(
              key: _formKey,
              child: CustomRegistrationForm(
                formKey: _formKey,
              ),
            ),
          ],
        ))
      ]),
    );
  }
}
