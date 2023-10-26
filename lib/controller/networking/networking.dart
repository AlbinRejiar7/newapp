import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:real_time_news_app1/model/api_model.dart';

class NetworkHelper {
  NewsApiModel? dataModel;

  Future<void> fetchAllData({String? category, String? country}) async {
    var url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=${country ?? 'in'}&$category&apiKey=9553fb966acb4a758af1dae41c4b259f");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      dataModel = NewsApiModel.fromJson(jsonDecode(response.body));
    } else {
      print('error');
    }
  }

  Future<void> fetchQueryData({String? query}) async {
    var url = Uri.parse(
        "https://newsapi.org/v2/everything?q=$query&apiKey=9553fb966acb4a758af1dae41c4b259f");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      dataModel = NewsApiModel.fromJson(jsonDecode(response.body));
    } else {
      print('error');
    }
  }
}
