import 'package:http/http.dart' as http;
import 'dart:convert';

Future getLoginUser(String email, String password) async {
  String url = 'http://10.0.2.2/Php/Controllers/UserController.php';
  final reponse = await http.post(url,
      headers: {
      "Access-Control-Allow-Origin": "https://developer.mozilla.org",
        "Accept": "Application/json",
      },
      body: {'email': email, 'password': password});
  var jsonReponse = jsonDecode(reponse.body);
  return (jsonReponse);
}

Future insertUser(
    String profile,
    String category,
    String email,
    String password,
    String firstname,
    String lastname,
    String description) async {
  String url = 'http://10.0.2.2/Php/Controllers/RegisterController.php';
  final reponse = await http.post(url, headers: {
    "Accept": "Application/json",
    "Access-Control-Allow-Origin": "*" 
  }, body: {
    'email': email,
    'password': password,
    'firstname': firstname,
    'lastname': lastname,
    'description': description,
    'category': category,
    'profiletype': profile,
  });
  var jsonReponse = jsonDecode(reponse.body);
  return (jsonReponse);
}
