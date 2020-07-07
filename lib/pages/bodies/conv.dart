import 'package:digital_helper_v2/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ConvBody extends StatefulWidget {
  final User user;

  ConvBody({this.user});
  @override
  _ConvBodyState createState() => _ConvBodyState();
}

class _ConvBodyState extends State<ConvBody> {
  final _suggestions = <String>[];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        child: Container(
          padding: EdgeInsets.only(left: 16, top: 48, right: 16),
          child: Column(
            children: <Widget>[
              _buildRow(),
              _buildRow(),
            ]
          ),
        ),
      ),
    );
  }

  Widget _buildRow() {
    return ListTile(
      onTap: () {

      },
      title: Text(
        "Message.",
      ),
      trailing: new Column(children: <Widget>[
        new Container(
          child: Icon(
            Icons.satellite,
          ),
        ),
      ]),
    );
  }

  // Widget _buildConvList() {
  //   return ListView.builder(
  //       padding: const EdgeInsets.all(16.0),
  //       itemBuilder: (context, i) {
  //         if (i.isOdd) return Divider();

  //         final index = i ~/ 2;
  //         if (index >= _suggestions.length) {
  //           _suggestions.addAll(generateWordPairs().take(10));
  //         }

  //         return _buildRow(_suggestions[index]);
  //       });
  // }
}
