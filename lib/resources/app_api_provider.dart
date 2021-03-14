import 'dart:convert';

import 'package:http/http.dart';
import 'package:ktzh_app/config.dart';
import 'package:ktzh_app/model/product_model.dart';

class ApiProvider {
  Future<List<Product>> fetchProducts() async {
    await Future.delayed(Duration(seconds: 2));
    var url = '$BACKEND_URL/api/shippings/';

    var response = await get(url);

    if (response.statusCode >= 500) {
      throw ("Произошла ошибка сервера, подождите немножко, и повторите запрос");
    } else if (response.statusCode >= 400) {
      throw ("Плохой запрос!");
    } else if (response.statusCode >= 300) {
      throw ('Произошла ошибка!');
    }

    var data = utf8.decode(response.bodyBytes);
    return Product.parseJsonList(json.decode(data));
    // return testData;
  }
}
