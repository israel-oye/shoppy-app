import 'package:dio/dio.dart';
import 'package:fetch_be/models/product.dart';


class ApiService {
  final _dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.npoint.io',
      receiveTimeout: Duration(seconds: 30),
      sendTimeout: Duration(seconds: 20),
    ),
  );

  Future<List<Product>> fetchItems() async{
    final response = await _dio.get('/7e09ae95cabb76d14f1b');
    final data = response.data as List<dynamic>;
    final List<Product> products = data
        .map((item) => Product.fromJson(item))
        .toList();
    return products;
  }
}