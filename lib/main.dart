import 'package:digital_helper_v2/pages/home.dart';
import 'package:digital_helper_v2/pages/login.dart';
import 'package:digital_helper_v2/pages/registration.dart';
import 'package:flutter/material.dart';

import 'pages/intro.dart';

void main() {
  runApp(MyApp());
}

final routes = {
  '/login': (BuildContext context) => LoginPage(),
  '/home': (BuildContext context) => HomePage(),
  '/register': (BuildContext context) => RegistrationPage(),
  '/intro': (BuildContext context) => IntroPage(),
  '/': (BuildContext context) => IntroPage()
};

class Bodies {
  static const int ALERTS = 0;
  static const int CONV = 1;
  static const int FRIEND_LIST = 2;
  static const int MORE = 3;
  static const int LOGOUT = 4;

  int currentBody = 0;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: Colors.red,
        accentColor: Colors.red,
        brightness: Brightness.dark,
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline4: TextStyle(fontSize: 21.0, fontWeight: FontWeight.bold),
          subtitle1: TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal),
          headline5: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText1: TextStyle(
            fontSize: 18.0,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}