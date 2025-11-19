import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fetch_be/widgets/product_item.dart';
import 'package:fetch_be/providers/product_provider.dart';


class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  static String title = 'Products';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      child: Consumer<ProductsProvider>(builder: (_, provider, _) {
        final products = provider.products;
        
        return ListView.separated(
            itemCount: products.length,
            separatorBuilder: (ctx, idx)=> SizedBox(height: 8,),
            itemBuilder: (ctx, idx) {
              final currentProduct = products.elementAt(idx);
              return Card(
                child: ProductItem(product: currentProduct),
              );
            },
          );
      }),
    );
  }
}