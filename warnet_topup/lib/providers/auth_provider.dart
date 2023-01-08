import 'package:flutter/material.dart';
import 'package:warnet_topup/models/users_model.dart';
import 'package:warnet_topup/services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  UsersModel? _user;

  UsersModel get user => _user!;

  set user(UsersModel _user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> login({
    String? username,
    String? password,
  }) async {
    try {
      UsersModel? user =
          await AuthService().login(username: username, password: password);

      _user = user;

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
