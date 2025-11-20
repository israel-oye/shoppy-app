import 'package:fetch_be/models/product.dart';
import 'package:fetch_be/services/api_service.dart';

class ProductRepository {
  final ApiService _apiService;

  ProductRepository(this._apiService);

  Future<List<Product>> fetchProducts(){
    return _apiService.fetchItems();
  }
}