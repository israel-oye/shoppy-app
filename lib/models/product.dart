import 'package:flutter/material.dart';

class Product {
  final int id;
  final String name;
  final double price;
  final Color color;

  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.color
  });

  factory Product.fromJson(Map<String, dynamic> json){
    return Product(
      id: json['id'], 
      name: json['name'], 
      price: json['price'], 
      color: Color(json['color'])
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'price': price,
    'color': color.toARGB32(),
  };
}

const List<Product> products = [
  Product(id: 1, name: 'Laptop', price: 1299.99, color: Color(0xFF2C3E50)),
  Product(id: 2, name: 'Smartphone', price: 899.99, color: Color(0xFF3498DB)),
  Product(id: 3, name: 'Tablet', price: 599.99, color: Color(0xFF1E90FF)),
  Product(id: 4, name: 'Headphones', price: 299.99, color: Color(0xFFE74C3C)),
  Product(id: 5, name: 'Smart Watch', price: 399.99, color: Color(0xFFFF69B4)),
  Product(id: 6, name: 'Keyboard', price: 149.99, color: Color(0xFF9B59B6)),
  Product(id: 7, name: 'Mouse', price: 79.99, color: Color(0xFF16A085)),
  Product(id: 8, name: 'Monitor', price: 449.99, color: Color(0xFFF39C12)),
  Product(id: 9, name: 'Webcam', price: 129.99, color: Color(0xFF27AE60)),
  Product(id: 10, name: 'Speaker', price: 199.99, color: Color(0xFF8E44AD)),
  Product(id: 11, name: 'Charger', price: 49.99, color: Color(0xFFFFD700)),
  Product(id: 12, name: 'Power Bank', price: 89.99, color: Color(0xFFC0392B)),
  Product(id: 13, name: 'USB Cable', price: 19.99, color: Color(0xFFFF4500)),
  Product(id: 14, name: 'HDMI Cable', price: 29.99, color: Color(0xFF2980B9)),
  Product(id: 15, name: 'Phone Case', price: 39.99, color: Color(0xFFE91E63)),
  Product(id: 16, name: 'Screen Protector', price: 14.99, color: Color(0xFF00BCD4)),
  Product(id: 17, name: 'Desk Lamp', price: 59.99, color: Color(0xFFFFA500)),
  Product(id: 18, name: 'Mouse Pad', price: 24.99, color: Color(0xFF4CAF50)),
  Product(id: 19, name: 'Phone Stand', price: 34.99, color: Color(0xFFFF6B6B)),
  Product(id: 20, name: 'Wireless Charger', price: 69.99, color: Color(0xFF00E5FF)),
];

