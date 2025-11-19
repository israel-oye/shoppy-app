import 'package:fetch_be/models/product.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier{
  List<Product> _items = [];

  List<Product> get items => _items;

  double get cartTotal => _items.fold(0, (previousValue, element)=> previousValue + element.price);

  void addToCart(Product product){
    _items.add(product);
    notifyListeners();
  }

  void removeItem(Product product){
    _items.remove(product);
    notifyListeners();
  }

  void clearCart(){
    _items.clear();
    notifyListeners();
  }
}