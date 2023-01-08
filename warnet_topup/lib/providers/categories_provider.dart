import 'package:flutter/material.dart';
import 'package:warnet_topup/models/categories_model.dart';
import 'package:warnet_topup/services/categories_service.dart';

class CategoriesProvider with ChangeNotifier {
  List<CategoriesModel> _categories = [];
  List<CategoriesModel> get categories => _categories;
  set categories(List<CategoriesModel> categories) {
    _categories = categories;
    notifyListeners();
  }

  CategoriesModel _category = CategoriesModel();
  CategoriesModel get category => _category;
  set category(CategoriesModel _category) {
    _category = category;
    notifyListeners();
  }

  Future<void> getAllCategories() async {
    try {
      List<CategoriesModel> categories =
          await CategoriesService().getAllCategories();
      _categories = categories;
    } catch (e) {
      print(e);
    }
  }

  Future<CategoriesModel?> getCategoryByID({
    int? id,
  }) async {
    try {
      CategoriesModel category =
          await CategoriesService().getCategoryByID(id: id);

      _category = category;

      return category;
    } catch (e) {
      print(e);
    }
  }
}
