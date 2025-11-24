import 'package:fetch_be/models/product.dart';
import 'package:fetch_be/pages/item_page.dart';
import 'package:fetch_be/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CartProvider>();
    return ListTile(
      onLongPress: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => ItemPage(item: product)),
        );
      },
      leading: CircleAvatar(backgroundColor: product.color,),
      title: Text(product.name),
      subtitle: Text('₦ ${product.price.toStringAsFixed(2)}'),
      trailing: Checkbox(
        value: provider.items.contains(product),
        onChanged: (val){
          if (val == true) {
            provider.addToCart(product);
          } else {
            provider.removeItem(product);
          }
        }
      ),
    );
  }
}