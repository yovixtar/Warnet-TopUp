import 'dart:convert';

import 'package:warnet_topup/models/categories_model.dart';
import 'package:http/http.dart' as http;

class CategoriesService {
  String baseUrl = "https://project.kuliah.iyabos.com/topup-v1";

  Future<List<CategoriesModel>> getAllCategories() async {
    var response = await http.get(
      Uri.parse(baseUrl + "/get_all_categories.php"),
    );

    if (jsonDecode(response.body)['meta']['status'] == 'success') {
      List data = jsonDecode(response.body)['data'];
      List<CategoriesModel> categories = [];

      print(data);

      for (var item in data) {
        categories.add(CategoriesModel.fromJson(item));
      }
      return categories;
    } else {
      throw Exception('Gagal Get All Categories');
    }
  }

  Future<CategoriesModel> getCategoryByID({int? id}) async {
    var response = await http.post(
      Uri.parse(baseUrl + "/get_category_by_id.php?id=${id}"),
    );

    if (jsonDecode(response.body)['meta']['status'] == 'success') {
      print(jsonDecode(response.body)['data']);
      // var data = jsonDecode(response.body)['data'];
      CategoriesModel category =
          CategoriesModel.fromJson(jsonDecode(response.body)['data']);
      return category;
    } else {
      throw Exception('Gagal Get Category By ID');
    }
  }
}
