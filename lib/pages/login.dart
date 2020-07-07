import 'package:digital_helper_v2/api/api.dart';
import 'package:digital_helper_v2/models/user.dart';
import 'package:digital_helper_v2/utils/custom_widgets.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  User user = new User();
  final passwordController = TextEditingController();
  String errorMsg = '';
  Color txtColor = Colors.white;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Column(children: <Widget>[
        MainLogo(
          imgHeight: MediaQuery.of(context).size.height * 0.35,
        ),
        Text(
          errorMsg,
          style: TextStyle(color: txtColor),
        ),
        Expanded(
            child: ListView(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  CustomControllerTextField(
                    fieldText: "Email",
                    validatorText: "Entrez une adresse mail valide.",
                    myController: emailController,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomControllerTextField(
                    fieldText: "Mot de passe",
                    validatorText: "Entrez un mot de passe valide",
                    myController: passwordController,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Nouvel utilisateur ?"),
                      FlatButton(
                        child: Text(
                          "Créer un compte",
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/register');
                        },
                      ),
                    ],
                  ),
                  StartButton(
                    id: 1,
                    btnText: "Connexion",
                    onBtnPressed: () async {
                      doLogin();
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SocialIcon(
                        iconName: 'assets/facebook.png',
                      ),
                      SizedBox(width: 10),
                      SocialIcon(
                        iconName: 'assets/twitter.png',
                      ),
                      SizedBox(width: 10),
                      SocialIcon(
                        iconName: 'assets/instagram.png',
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ))
      ]),
    );
  }

  void doLogin() async {
    if (_formKey.currentState.validate()) {
      var email = emailController.text;
      var password = passwordController.text;
      print("email = " + email + '\n' + password);
      setState(() {
        txtColor = Colors.white;
        errorMsg = 'Patientez...';
      });
      var rep = await getLoginUser(email, password);
      print(rep);
      if (rep.containsKey('status')) {
        setState(() {
          errorMsg = rep['status_text'];
          if (rep['status'] == 1) {
            setState(() {
              txtColor = Colors.green;
              errorMsg = "Connexion réussie!";
              user = User.map(rep['user_arr']);
              user.status = "Disponible";
            });
            Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false, arguments: user);
          } else {
            setState(() {
              txtColor = Colors.red;
              errorMsg = 'Identifiant ou mot de passe incorrect';
            });
          }
        });
      }
    }
  }
}