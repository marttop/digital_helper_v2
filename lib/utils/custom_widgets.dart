import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

//Generates a reusable logo
class MainLogo extends StatelessWidget {
  final double imgHeight;
  MainLogo({this.imgHeight});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset('assets/logo_transparent.png'),
      width: MediaQuery.of(context).size.width,
      height: imgHeight,
    );
  }
}

//Generates a fully custom button with logo
class StartButton extends StatelessWidget {
  final String btnText;
  final Function onBtnPressed;
  final int id;
  StartButton({this.btnText, this.onBtnPressed, this.id});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
      child: MaterialButton(
        child: Padding(
          padding: getPadding(id),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                btnText,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(width: 10),
              Icon(Icons.arrow_right),
            ],
          ),
        ),
        onPressed: onBtnPressed,
        color: Theme.of(context).primaryColor,
      ),
    );
  }

  EdgeInsets getPadding(int id) {
    if (id == 0)
      return (EdgeInsets.all(18.0));
    else if (id == 1)
      return (EdgeInsets.all(10.0));
    else
      return null;
  }
}

//Generates a custom TextField with validator and controller
class CustomControllerTextField extends StatelessWidget {
  final String fieldText;
  final String validatorText;
  final myController;
  CustomControllerTextField(
      {this.fieldText, this.validatorText, this.myController});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
      child: TextFormField(
        maxLines: getMaxLines(fieldText),
        decoration: InputDecoration(
            labelText: fieldText,
            labelStyle: TextStyle(
              fontSize: 20,
            )),
        controller: myController,
        validator: (value) {
          if (value.isEmpty) {
            return validatorText;
          }
          return isMailValid(value, fieldText);
        },
        obscureText: isPassword(fieldText),
      ),
    );
  }

  static int getMaxLines(String str) {
    if (str == "Decription") {
      return null;
    } else
      return 1;
  }

  static bool isPassword(String str) {
    if (str == "Mot de passe" || str == "Password" || str == "Confirmez mot de passe") {
      return true;
    } else
      return false;
  }

  static String isMailValid(String value, String fieldText) {
    if (isPassword(fieldText) || fieldText != "Email")
      return null;
    else if (!(value.contains('@') && value.contains('.')))
      return "Entrez une adresse mail valide.";
    else
      return null;
  }
}

//Generates a custom infinite textfield with multiline option set to null
class CustomInfiniteTextField extends StatelessWidget {
  final String fieldText;
  final String validatorText;
  final myController;
  CustomInfiniteTextField(
      {this.fieldText, this.validatorText, this.myController});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
      child: TextFormField(
        keyboardType: TextInputType.multiline,
        maxLines: null,
        decoration: InputDecoration(
            labelText: fieldText,
            labelStyle: TextStyle(
              fontSize: 20,
            )),
        controller: myController,
        validator: (value) {
          if (value.isEmpty) {
            return validatorText;
          }
          return null;
        },
      ),
    );
  }

  static int getMaxLines(String str) {
    if (str == "Decription") {
      return null;
    } else
      return 1;
  }

  static bool isPassword(String str) {
    if (str == "Mot de passe" || str == "Password") {
      return true;
    } else
      return false;
  }

  static String isMailValid(String value, String fieldText) {
    if (isPassword(fieldText))
      return null;
    else if (!(value.contains('@') && value.contains('.')))
      return "Entrez une adresse mail valide.";
    else
      return null;
  }
}

//Generates an icon 40*40
class SocialIcon extends StatelessWidget {
  final String iconName;
  SocialIcon({this.iconName});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(iconName),
      width: 40,
      height: 40,
    );
  }
}

//Generates an array of textfield, the number depends on nbFields variable
class CustomTextFieldArray extends StatefulWidget {
  final int nbFields;
  final List<String> _array;
  final List<TextEditingController> _controller;
  CustomTextFieldArray(this.nbFields, this._controller, this._array);
  @override
  _CustomTextFieldArrayState createState() => _CustomTextFieldArrayState();
}

class _CustomTextFieldArrayState extends State<CustomTextFieldArray> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: buildArray(),
    );
  }

  List<Widget> buildArray() {
    List<Widget> _customTextFieldArray = List<Widget>();
    for (int i = 0; i < widget.nbFields; i++) {
      _customTextFieldArray.add(CustomControllerTextField(
        fieldText: widget._array[i],
        validatorText: "Champ obligatoire",
        myController: widget._controller[i],
      ));
      _customTextFieldArray.add(SizedBox(height: 10));
    }
    return _customTextFieldArray;
  }
}
