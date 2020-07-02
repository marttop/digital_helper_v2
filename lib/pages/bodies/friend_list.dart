import 'package:digital_helper_v2/models/user.dart';
import 'package:flutter/material.dart';

class FriendListBody extends StatefulWidget {
  User user;

  FriendListBody({this.user});
  @override
  _FriendListBodyState createState() => _FriendListBodyState();
}

class _FriendListBodyState extends State<FriendListBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        child: Container(
          padding: EdgeInsets.only(left: 16, top: 48, right: 16),
          child: Center(
              child: Text(
            "Liste d'amis",
          )),
        ),
      ),
    );
  }
}
