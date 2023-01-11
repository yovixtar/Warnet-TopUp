import 'package:flutter/material.dart';
import 'package:warnet_topup/models/nominal_model.dart';
import 'package:warnet_topup/services/nominal_service.dart';

class NominalProvider with ChangeNotifier {
  List<NominalModel> _nominal = [];
  List<NominalModel> get nominal => _nominal;
  set nominal(List<NominalModel> nominal) {
    _nominal = nominal;
    notifyListeners();
  }

  Future<void> getNominalByGameID(int id) async {
    try {
      List<NominalModel> nominal =
          await NominalService().getNominalByGameID(id);
      _nominal = nominal;
    } catch (e) {
      print(e);
    }
  }
}
