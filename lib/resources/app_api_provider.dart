import 'package:ktzh_app/model/product_model.dart';

class ApiProvider {
  Future<List<Product>> fetchProducts() async {
    await Future.delayed(Duration(seconds: 2));
    return testData;
  }
}
