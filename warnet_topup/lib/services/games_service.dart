import 'dart:convert';

import 'package:warnet_topup/models/games_model.dart';
import 'package:http/http.dart' as http;

class GamesService {
  String baseUrl = "https://project.kuliah.iyabos.com/topup-v1";

  Future<List<GamesModel>> getGames() async {
    var response = await http.get(
      Uri.parse(baseUrl + "/get_all_games.php"),
    );
    print(jsonDecode(response.body)['data']);

    if (jsonDecode(response.body)['meta']['status'] == 'success') {
      List data = jsonDecode(response.body)['data'];
      List<GamesModel> games = [];

      for (var item in data) {
        games.add(GamesModel.fromJson(item));
      }
      return games;
    } else {
      throw Exception('Gagal Get All Games');
    }
  }
}
