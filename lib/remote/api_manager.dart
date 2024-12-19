import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/model/articles_response/Articles_response.dart';
import 'package:news_app/model/source_response/Source_response.dart';

class ApiManager {
  static Future<SourceResponse?> getSources(String category) async {
    try {
      Uri url = Uri.https("newsapi.org", "v2/top-headlines/sources", {
        "apiKey": "bcf5536b7fda418498e54c618ad4a9d3",
        "category": category,
      });
      var response = await http.get(url);
      var json = jsonDecode(response.body);
      var sourceResponse = SourceResponse.fromJson(json);
      return sourceResponse;
    } catch (error) {
      print(error.toString());
    }
  }

  static Future<ArticlesResponse?> getArticles(String sourceId) async {
    //   https:///?apiKey=&=national-geographic
    try {
      Uri url = Uri.https("newsapi.org", "v2/everything", {
        "apiKey": "bcf5536b7fda418498e54c618ad4a9d3",
        "sources": sourceId,
      });
      var response = await http.get(url);
      var json = jsonDecode(response.body);
      var articlesResponse = ArticlesResponse.fromJson(json);
      return articlesResponse;
    } catch (error) {
      print(error.toString());
    }
  }
}
