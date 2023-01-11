import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:warnet_topup/models/servers_model.dart';

class ServersService {
  String baseUrl = "https://project.kuliah.iyabos.com/topup-v1";

  Future<List<ServersModel>> getServersByGameID(int id) async {
    var response = await http.get(
      Uri.parse(baseUrl + "/get_servers_by_game.php?game_id=${id}"),
    );

    if (jsonDecode(response.body)['meta']['status'] == 'success') {
      List data = jsonDecode(response.body)['data'];
      List<ServersModel> servers = [];

      print(data);

      for (var item in data) {
        servers.add(ServersModel.fromJson(item));
      }
      return servers;
    } else {
      throw Exception('Gagal Get Servers Game');
    }
  }
}
