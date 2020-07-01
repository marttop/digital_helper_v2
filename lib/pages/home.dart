import 'package:digital_helper_v2/models/user.dart';
import 'package:digital_helper_v2/pages/menu.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static double width;
  static bool isOpen = true;

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
              IconButton(
                  icon: Icon(Icons.notifications_active), onPressed: () {}),
              SizedBox(width: 30),
              IconButton(icon: Icon(Icons.message), onPressed: () {}),
              SizedBox(width: 30),
              IconButton(icon: Icon(Icons.people_outline), onPressed: () {}),
              SizedBox(width: 30),
              IconButton(icon: Icon(Icons.more_horiz), onPressed: () {})
            ],
          ),
        ],
      ),
      body: Stack(
        children: [
          MenuPage(user: user),
          dashboard(context, user),
        ],
      ),
    );
  }

  Widget dashboard(context, user) {
    return AnimatedPositioned(
      top: 0,
      bottom: 0,
      left: isOpen ? 0 : 0.6 * width,
      right: isOpen ? 0 : -0.4 * width,
      duration: Duration(
        milliseconds: 300,
      ),
      child: Material(
        child: Container(
          padding: EdgeInsets.only(left: 16, top: 48, right: 16),
          child: Center(
              child: Text(
            "Bonjour ${user.firstname} ${user.lastname}",
          )),
        ),
      ),
    );
  }
}
