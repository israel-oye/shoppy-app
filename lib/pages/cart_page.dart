import 'package:fetch_be/models/product.dart';
import 'package:fetch_be/providers/cart_provider.dart';
import 'package:fetch_be/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  static String title = 'Cart';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Consumer<CartProvider>(
      builder: (context, provider, _) {
        final cartItems = provider.items;
        return cartItems.isEmpty
            ? _buildEmptyState(context)
            : _buildCart(cartItems, theme, provider);
      },
    );
  }

  Widget _buildCart(List<Product> cartItems, ThemeData theme, CartProvider provider) {
    return Column(
        children: [
          Flexible(
            flex: 3,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
              itemCount: cartItems.length,
              itemBuilder: (ctx, idx) {
                final currentItem = cartItems.elementAt(idx);
                return ProductItem(product: currentItem);
              },
            ),
          ),
          SizedBox(height: 24,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Total', style: theme.textTheme.headlineSmall),
              SizedBox(width: 16),
              Text(
                '₦${provider.cartTotal.toStringAsFixed(2)}',
                style: theme.textTheme.headlineSmall,
              ),
            ],
          ),
        ],
      );
  }

  Widget _buildEmptyState(BuildContext context){
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.add_shopping_cart, 
            size: 62,
            color: theme.colorScheme.secondary,
          ),
          SizedBox(height: 8),
          Text(
            'Empty Cart',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.secondary,
            ),
          ),
          Text('Add an item to the cart and it will show up here.'),
        ],
      ),
    );
  }

  
}
