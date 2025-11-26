import 'package:fetch_be/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClearCartButton extends StatelessWidget {
  const ClearCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Clear cart'),
            content: Text('Are you sure you want to clear the cart?'),
            actions: [
              TextButton(
                onPressed: () {
                  context.read<CartProvider>().clearCart();
                  Navigator.pop(context);
                },
                child: Text('Yes'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('No'),
              ),
            ],
          ),
        );
      },
      icon: Icon(Icons.remove_shopping_cart),
    );
  }
}
