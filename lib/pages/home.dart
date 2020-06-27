import 'package:digital_helper_v2/models/user.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Accueil",
          style: Theme.of(context).textTheme.headline4,
        ),
        backgroundColor: Colors.black26,
        elevation: 0.0,
      ),
      body: Center(
        child: Text(
          "Bonjour ${user.firstname} ${user.lastname}",
        )
      ),
    );
  }
}