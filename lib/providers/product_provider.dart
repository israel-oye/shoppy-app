import 'package:dio/dio.dart';
import 'package:fetch_be/models/product.dart';
import 'package:fetch_be/repositories/product_repository.dart';
import 'package:flutter/material.dart';

class ProductsProvider extends ChangeNotifier{
  final ProductRepository _repository;
  List<Product> _products = [];
  bool _isLoading = false;
  String? _error;

  ProductsProvider(this._repository);

  List<Product> get products => _products;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchProducts() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try{
      _products = await _repository.fetchProducts();
    } catch(e){
      if (e is DioException) {
        _error = 'Request error: ${e.message}';
        return;
      }
      _error = e.toString();
    } finally{
      _isLoading = false;
      notifyListeners();
    }
  }
}