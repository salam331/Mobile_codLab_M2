import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../models/article.dart';

class HttpController extends GetxController {
  static const String _baseUrl =
      'https://my-json-server.typicode.com/Fallid/codelab-api/';

  RxList<Article> articles = RxList<Article>([]);
  RxBool isLoading = false.obs;

  @override
  void onInit() async {
    await fetchArticles();
    super.onInit();
  }

  Future<void> fetchArticles() async {
    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse('$_baseUrl/articles'));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body)
            as List<dynamic>; // Pastikan tipe List di sini
        articles.value =
            jsonData.map((article) => Article.fromJson(article)).toList();
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('An error occurred: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
