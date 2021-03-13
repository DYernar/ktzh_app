import 'package:ktzh_app/model/product_model.dart';
import 'package:ktzh_app/resources/app_api_provider.dart';

class AppRepository {
  ApiProvider _apiProvider = ApiProvider();
  Future<List<Product>> fetchProductList() async {
    return await _apiProvider.fetchProducts();
  }
}
