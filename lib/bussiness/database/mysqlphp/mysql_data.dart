import 'dart:convert';

import 'package:http/http.dart' as http;

getMethod() async {
  String theUrl = "https://edan-demo.000webhostapp.com/getData.php";
  var res = await http
      .get(Uri.parse(theUrl), headers: {"Accept": "application/json"});
  var responseBody = json.decode(res.body);

  print("#######################################");
  print(responseBody);
  print("#######################################");
}
