import 'dart:convert';
import 'package:flutter_app_test/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserDataService {
  static var client = http.Client();

  static Future<UserData?> fetchAllData() async {
    var body = {'month': '6', 'token': 'e4c1a5aaf59f7204ca1e411d8bf060bd'};

    var response = await client.post(
        Uri.parse('http://canteen.benzyinfotech.com/api/v3/userdata'),
        body: body);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return userDataFromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  }
}
