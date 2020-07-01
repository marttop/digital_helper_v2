import 'package:digital_helper_v2/models/user.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  final User user;
  MenuPage({this.user});
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
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
                  title: Text(widget.user.status),
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
      switch (widget.user.status) {
        case "Disponible":
          statusColor = Colors.orange;
          statusIcon = Icons.timelapse;
          widget.user.status = "Occupé";
          break;
        case "Occupé":
          statusColor = Colors.red;
          statusIcon = Icons.do_not_disturb_on;
          widget.user.status = "Indisponible";
          break;
        case "Indisponible":
          statusColor = Colors.green;
          statusIcon = Icons.check_circle;
          widget.user.status = "Disponible";
          break;
        default:
      }
    });
  }
}
