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
  final _suggestions = <String>[
    "Conversation 1",
    "Conversation 2",
    "Conversation 3",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        child: Container(
          padding: EdgeInsets.only(left: 16, top: 48, right: 16),
          child: _buildConvList(),
        ),
      ),
    );
  }

  Widget _buildRow(String item) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
      child: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(width: 1.0, color: Color(0xFFFFFFFFFF)),
              left: BorderSide(width: 1.0, color: Color(0xFFFFFFFFFF)),
              right: BorderSide(width: 1.0, color: Color(0xFFFF000000)),
              bottom: BorderSide(width: 1.0, color: Color(0xFFFF000000)),
            ),
          ),
        child: ListTile(
          onTap: () {

          },
          title: Text(
            item,
          ),
          trailing: new Column(children: <Widget>[
            new Container(
              child: Icon(
                Icons.satellite,
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget _buildConvList() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _suggestions.length,
        itemBuilder: (context, i) {
          return _buildRow(_suggestions[i]);
        });
  }
}
