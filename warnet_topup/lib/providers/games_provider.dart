import 'package:flutter/material.dart';
import 'package:warnet_topup/models/games_model.dart';
import 'package:warnet_topup/services/games_service.dart';

class GamesProvider with ChangeNotifier {
  List<GamesModel> _games = [];

  List<GamesModel> get games => _games;

  set games(List<GamesModel> games) {
    _games = games;
    notifyListeners();
  }

  Future<void> getGames() async {
    try {
      List<GamesModel> games = await GamesService().getGames();
      _games = games;
    } catch (e) {
      print(e);
    }
  }
}
