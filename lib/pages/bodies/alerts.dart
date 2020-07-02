import 'package:digital_helper_v2/models/user.dart';
import 'package:flutter/material.dart';

class AlertBody extends StatefulWidget {
  final User user;

  AlertBody({this.user});
  @override
  _AlertBodyState createState() => _AlertBodyState();
}

class _AlertBodyState extends State<AlertBody> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: EdgeInsets.only(left: 16, top: 48, right: 16),
        child: Center(
            child: Text(
          "Bonjour ${widget.user.firstname} ${widget.user.lastname}",
        )),
      ),
    );
  }
}
