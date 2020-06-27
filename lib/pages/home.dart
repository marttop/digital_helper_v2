import 'package:digital_helper_v2/models/user.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final User user;
  HomePage({this.user});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Bonjour ${user.firstname} ${user.lastname}",
        )
      ),
    );
  }
}