import 'package:digital_helper_v2/models/user.dart';
import 'package:flutter/material.dart';

class MoreBody extends StatefulWidget {
  User user;

  MoreBody({this.user});
  @override
  _MoreBodyState createState() => _MoreBodyState();
}

class _MoreBodyState extends State<MoreBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        child: Container(
          padding: EdgeInsets.only(left: 16, top: 48, right: 16),
          child: Center(
              child: Text(
            "Découvrez plus!",
          )),
        ),
      ),
    );
  }
}