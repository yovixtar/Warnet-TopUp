import 'package:flutter/material.dart';
import 'package:warnet_topup/models/nominal_model.dart';
import 'package:warnet_topup/services/nominal_service.dart';

class NominalProvider with ChangeNotifier {
  List<NominalModel> _nominal = [];
  int _price = 0;

  List<NominalModel> get nominal => _nominal;
  set nominal(List<NominalModel> nominal) {
    _nominal = nominal;
    notifyListeners();
  }

  int get price => _price;
  set price(int price) {
    _price = price;
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

  Future<void> getPriceByNominal(int id, String name) async {
    try {
      int price = await NominalService().getPriceByNominal(id, name);
      _price = price;
    } catch (e) {
      print(e);
    }
  }
}
