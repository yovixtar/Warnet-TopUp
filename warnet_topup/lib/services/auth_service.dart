import 'dart:convert';

import 'package:warnet_topup/models/users_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  String baseUrl = "https://project.kuliah.iyabos.com/topup-v1";

  Future<UsersModel?> login({
    String? username,
    String? password,
  }) async {
    var response = await http.post(
      Uri.parse(baseUrl + "/login.php"),
      body: {
        'username': username,
        'password': password,
      },
    );
    print("Username - Password : " + username! + " - " + password!);
    print("Status : " + jsonDecode(response.body)['meta']['status']);
    if (jsonDecode(response.body)['meta']['status'] == 'success') {
      print(jsonDecode(response.body));
      // var data = jsonDecode(response.body)['data'];
      UsersModel user = UsersModel.fromJson(jsonDecode(response.body)['data']);
      return user;
    } else {
      throw Exception('Gagal Login');
    }
  }
}
