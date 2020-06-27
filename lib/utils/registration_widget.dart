import 'package:digital_helper_v2/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:digital_helper_v2/api/api.dart';

import 'custom_widgets.dart';

//Generates a fully customized widget with a title a textfield and a dropdownlist
class CustomDescriptionGetter extends StatefulWidget {
  final bool isProfile;
  final _CustomRegistrationFormState parent;
  final TextEditingController controller;
  CustomDescriptionGetter({this.isProfile, this.controller, this.parent});

  @override
  _CustomDescriptionGetterState createState() =>
      _CustomDescriptionGetterState();
}

class _CustomDescriptionGetterState extends State<CustomDescriptionGetter> {
  static String myValue = "Informatique";
  @override
  Widget build(BuildContext context) {
    if (widget.isProfile == true)
      return SizedBox(height: 0);
    else
      return Column(children: <Widget>[
        SizedBox(height: 15),
        Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Text(
              "Faites une brève description de vous et de vos activités",
              textAlign: TextAlign.center,
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor)),
        ),
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Container(
            color: Colors.grey[800],
            width: MediaQuery.of(context).size.width,
            child: DropdownButton<String>(
                value: myValue,
                underline: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 1,
                  color: Colors.transparent,
                ),
                items: <String>[
                  'Informatique',
                  'Commerce',
                  'Sciences',
                  'Aviation',
                  'Sport',
                  'Seduction',
                  'Comptabilité',
                  'Management'
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Center(child: Text(value)),
                  );
                }).toList(),
                onChanged: (String newValue) {
                  setState(() {
                    this.widget.parent.setState(() {
                      this.widget.parent.mySeccondValue = newValue;
                    });
                    myValue = newValue;
                  });
                }),
          ),
        ),
        SizedBox(height: 10),
        CustomInfiniteTextField(
          fieldText: "Description",
          validatorText: "Entrez une description",
          myController: widget.controller,
        ),
      ]);
  }
}

//Generates a custom DateField
class CustomControllerDateField extends StatelessWidget {
  final _CustomRegistrationFormState parent;
  CustomControllerDateField({this.parent});
  @override
  Widget build(BuildContext context) {
    return InputDatePickerFormField(
      onDateSaved: (DateTime newDate) {
        parent.birthdate = newDate;
      },
      firstDate: DateTime(1920),
      lastDate: DateTime(2020),
      fieldLabelText: "Date de naissance",
    );
  }
}

//Generates a fully customized register form for a new user.
class CustomRegistrationForm extends StatefulWidget {
  final formKey;
  CustomRegistrationForm({this.formKey});
  @override
  _CustomRegistrationFormState createState() => _CustomRegistrationFormState();
}

class _CustomRegistrationFormState extends State<CustomRegistrationForm> {
  String myValue = "Aspirant";
  String mySeccondValue = "";
  DateTime birthdate;
  String validatorText = "Valide";
  bool isValid = false;
  bool isProfile = true;

  final emailController = TextEditingController();
  final confEmailController = TextEditingController();
  final pwdController = TextEditingController();
  final confPwdController = TextEditingController();
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    emailController.dispose();
    confEmailController.dispose();
    pwdController.dispose();
    confPwdController.dispose();
    firstnameController.dispose();
    lastnameController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      SizedBox(height: 10),
      Text("Informations personnelles",
          style: TextStyle(
              decoration: TextDecoration.underline,
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor)),
      CustomControllerTextField(
        fieldText: "Nom",
        validatorText: "Entrez votre nom.",
        myController: firstnameController,
      ),
      CustomControllerTextField(
        fieldText: "Prénom",
        validatorText: "Entrez votre Prénom.",
        myController: lastnameController,
      ),
      CustomControllerDateField(),
      Text("Informations du compte",
          style: TextStyle(
              decoration: TextDecoration.underline,
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor)),
      SizedBox(height: 10),
      CustomControllerTextField(
        fieldText: "Email",
        validatorText: "Entrez votre Email.",
        myController: emailController,
      ),
      CustomControllerTextField(
        fieldText: "Confirmez email",
        validatorText: "Entrez votre Email.",
        myController: confEmailController,
      ),
      CustomControllerTextField(
        fieldText: "Mot de passe",
        validatorText: "Entrez votre mot de passe.",
        myController: pwdController,
      ),
      CustomControllerTextField(
        fieldText: "Confirmez mot de passe",
        validatorText: "Entrez votre mot de passe.",
        myController: confPwdController,
      ),
      SizedBox(height: 15),
      CustomDescriptionGetter(
        controller: descriptionController,
        isProfile: isProfile,
        parent: this,
      ),
      Text("Type de profile",
          style: TextStyle(
              decoration: TextDecoration.underline,
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor)),
      SizedBox(height: 10),
      Padding(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Container(
          color: Colors.grey[800],
          width: MediaQuery.of(context).size.width,
          child: DropdownButton<String>(
              value: myValue,
              underline: Container(
                width: MediaQuery.of(context).size.width,
                height: 1,
                color: Colors.transparent,
              ),
              items: <String>['Aspirant', 'Coach'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Center(child: Text(value)),
                );
              }).toList(),
              onChanged: (String newValue) {
                setState(() {
                  if (newValue == "Aspirant")
                    isProfile = true;
                  else
                    isProfile = false;
                  myValue = newValue;
                });
              }),
        ),
      ),
      SizedBox(height: 15),
      if (isValid)
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            children: <Widget>[
              Text(
                validatorText,
                style: TextStyle(color: Colors.red),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      StartButton(
        id: 1,
        btnText: "Enregistrer",
        onBtnPressed: doRegister,
      ),
    ]);
  }

  void doRegister() async {
    if (!(pwdController.text == confPwdController.text &&
        emailController.text == confEmailController.text)) {
      setState(() {
        validatorText =
            "Votre mot de passe ou email ne corespond pas a celui confirmé";
        isValid = true;
      });
      return;
    } else {
      setState(() {
        isValid = false;
      });
    }

    if (widget.formKey.currentState.validate()) {
      var rep = await insertUser(
          myValue,
          mySeccondValue,
          emailController.text,
          pwdController.text,
          firstnameController.text,
          lastnameController.text,
          descriptionController.text,
          birthdate);
      if (rep.containsKey('status')) {
        setState(() {
          if (rep['status'] == 1) {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return LoginPage();
            }));
            showPopUp(rep['status_text']);
          } else {
            showPopUp(rep['status_text']);
          }
        });
      }
    }
  }

  void showPopUp(String msg) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Inscription"),
            content: Text(msg),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Fermer")),
            ],
          );
        });
  }
}
