import 'package:flutter/material.dart';
import 'package:warnet_topup/models/servers_model.dart';
import 'package:warnet_topup/services/servers_service.dart';

class ServersProvider with ChangeNotifier {
  List<ServersModel> _servers = [];
  List<ServersModel> get servers => _servers;
  set servers(List<ServersModel> servers) {
    _servers = servers;
    notifyListeners();
  }

  Future<void> getServersByGameID(int id) async {
    try {
      List<ServersModel> servers =
          await ServersService().getServersByGameID(id);
      _servers = servers;
    } catch (e) {
      print(e);
    }
  }
}
