import 'package:digital_helper_v2/main.dart';
import 'package:digital_helper_v2/models/user.dart';
import 'package:digital_helper_v2/pages/bodies/alerts.dart';
import 'package:digital_helper_v2/pages/menu.dart';
import 'package:flutter/material.dart';

import 'bodies/conv.dart';
import 'bodies/friend_list.dart';
import 'bodies/more.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static double width;
  static bool isOpen = true;
  int body = Bodies.ALERTS;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    width = size.width;
    final User user = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            setState(() {
              isOpen = !isOpen;
            });
          },
        ),
        title: Text(
          "Accueil",
          style: Theme.of(context).textTheme.subtitle1,
        ),
        backgroundColor: Colors.black26,
        elevation: 0.0,
      ),
      bottomNavigationBar: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(icon: Icon(Icons.notifications_active), onPressed: () {
                  setState(() {
                    body = Bodies.ALERTS;
                  });
              }),
              SizedBox(width: 30),
              IconButton(icon: Icon(Icons.message), onPressed: () {
                setState(() {
                  body = Bodies.CONV;
                });
              }),
              SizedBox(width: 30),
              IconButton(icon: Icon(Icons.people_outline), onPressed: () {
                setState(() {
                  body = Bodies.FRIEND_LIST;
                });
              }),
              SizedBox(width: 30),
              IconButton(icon: Icon(Icons.more_horiz), onPressed: () {
                setState(() {
                  body = Bodies.MORE;
                });
              })
            ],
          ),
        ],
      ),
      body: Stack(
        children: [
          MenuPage(user: user),
          myBody(user),
        ],
      ),
    );
  }

  Widget myBody(user) {
    return AnimatedPositioned(
      top: 0,
      bottom: 0,
      left: isOpen ? 0 : 0.6 * width,
      right: isOpen ? 0 : -0.4 * width,
      duration: Duration(
        milliseconds: 300,
      ),
      child: bodySelector(user) 
    );
  }

  Widget bodySelector(user) {
    switch (body) {
      case Bodies.ALERTS :
        return AlertBody(user: user);
        break;
      case Bodies.CONV :
        return ConvBody(user: user);
        break;
      case Bodies.FRIEND_LIST :
        return FriendListBody(user: user);
        break;
      case Bodies.MORE :
        return MoreBody(user: user);
        break;
      default:
        return SizedBox();
    }
  }
}
