import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:work/constants.dart';
import 'package:work/models/hot_category_job_model.dart';
import 'package:http/http.dart' as http;

class HotCategoryJobProvider with ChangeNotifier {
  // HotCategoryJobModel? _categoryJobModel;

  // HotCategoryJobModel get categoryJobModel => _categoryJobModel!;

  // set categoryJobModel(HotCategoryJobModel hotCategoryJobModel) {
  //   _categoryJobModel = hotCategoryJobModel;
  //   notifyListeners();
  // }

  Future<List<HotCategoryJobModel>> getHotCategories() async {
    try {
      final response = await http.get(Uri.parse("$url/categories"));

      print(response.statusCode);
      print("category result ->" + response.body);

      if (response.statusCode == 200) {
        List<HotCategoryJobModel> categories = [];
        List parsedJson = jsonDecode(response.body);

        parsedJson.forEach((category) {
          categories.add(HotCategoryJobModel.fromJson(category));
        });

        return categories;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
}
