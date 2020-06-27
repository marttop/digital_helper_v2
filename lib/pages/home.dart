import 'package:digital_helper_v2/models/user.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Center(
        child: Text(
          "Bonjour ${user.firstname} ${user.lastname}",
        )
      ),
    );
  }
}