import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:warnet_topup/models/nominal_model.dart';

class NominalService {
  String baseUrl = "https://project.kuliah.iyabos.com/topup-v1";

  Future<List<NominalModel>> getNominalByGameID(int id) async {
    var response = await http.get(
      Uri.parse(baseUrl + "/get_nominal_by_game.php?game_id=${id}"),
    );

    if (jsonDecode(response.body)['meta']['status'] == 'success') {
      List data = jsonDecode(response.body)['data'];
      List<NominalModel> nominal = [];

      print(data);

      for (var item in data) {
        nominal.add(NominalModel.fromJson(item));
      }
      return nominal;
    } else {
      throw Exception('Gagal Get Game Nominal');
    }
  }

  Future<int> getPriceByNominal(int id, String name) async {
    var response = await http.get(
      Uri.parse(baseUrl +
          "/get_price_by_nominal.php?game_id=${id}&nominal_name=${name}"),
    );

    if (jsonDecode(response.body)['meta']['status'] == 'success') {
      int data = jsonDecode(response.body)['data']['price'];
      print(data);

      return data;
    } else {
      throw Exception('Gagal Get Game Price Topup');
    }
  }
}
