import 'package:digital_helper_v2/models/user.dart';
import 'package:flutter/material.dart';

class ConvBody extends StatefulWidget {
  final User user;

  ConvBody({this.user});
  @override
  _ConvBodyState createState() => _ConvBodyState();
}

class _ConvBodyState extends State<ConvBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        child: Container(
          padding: EdgeInsets.only(left: 16, top: 48, right: 16),
          child: Center(
              child: Text(
            "Page des conversations",
          )),
        ),
      ),
    );
  }
}
