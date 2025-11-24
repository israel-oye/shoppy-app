import 'package:fetch_be/models/product.dart';
import 'package:fetch_be/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemPage extends StatelessWidget {
  final Product item;

  const ItemPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: theme.colorScheme.onPrimary,
        actions: [
          Consumer<CartProvider>(
            builder: (_, provider, _){
              return Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(Icons.shopping_cart),
                Positioned(
                  left: -12,
                  top: -10,
                  child: Container(
                    alignment: Alignment.center,
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color.fromARGB(103, 255, 82, 82),
                    ),
                    child: Text(
                        '${provider.items.length}',
                        style: TextStyle(fontSize: 12),
                      ),
                  ),
                ),
              ],
            );
            },
          ),
          SizedBox(width: 8,)
        ],
        title: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.name,
              style: theme.textTheme.headlineSmall?.copyWith(
                color: theme.colorScheme.onPrimary
              )
            ),
            Text(
              '₦ ${item.price.toStringAsFixed(2)}',
              style: theme.textTheme.labelLarge?.copyWith(
                color: theme.colorScheme.onPrimary
              ),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  item.color,
                  item.color.withAlpha(120)
                ]
              )
            ),
          ),
          SizedBox(height: 16,),
          Text(
            item.name,
            style: theme.textTheme.bodyLarge?.copyWith(
              fontSize: 24,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 8,),
          Text(
            '₦ ${item.price.toStringAsFixed(2)}',
            style: theme.textTheme.bodyMedium?.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 6),
          ElevatedButton(
            onPressed: (){}, 
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Add to Cart'),
                SizedBox(width: 8,),
                Icon(Icons.add)
              ],
            )
          )
        ],
      ),
    );
  }
}