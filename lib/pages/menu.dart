import 'package:digital_helper_v2/models/user.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  final User user;
  MenuPage({this.user});
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  String statusText = "Disponible";
  IconData statusIcon = Icons.check_circle;
  Color statusColor = Colors.green;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black26,
      child: Padding(
        padding: EdgeInsets.only(left: 0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(),
                  title: Text(widget.user.firstname +
                      " " +
                      widget.user.lastname.toUpperCase()),
                  subtitle: Text(widget.user.email),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(statusIcon, color: statusColor),
                  title: Text(statusText),
                  onTap: changeUserStatus,
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("Paramètres"),
                  onTap: () {},
                ),
              ]),
        ),
      ),
    );
  }

  void changeUserStatus() {
    setState(() {
      if (statusText == "Disponible") {
        statusColor = Colors.orange;
        statusText = "Occupé";
        statusIcon = Icons.timelapse;
      } else if (statusText == "Occupé") {
        statusColor = Colors.red;
        statusText = "Indisponible";
        statusIcon = Icons.do_not_disturb_on;
      } else if (statusText == "Indisponible") {
        statusColor = Colors.green;
        statusText = "Disponible";
        statusIcon = Icons.check_circle;
      }
    });
  }
}
