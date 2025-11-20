import 'package:fetch_be/models/product.dart';
import 'package:fetch_be/repositories/product_repository.dart';
import 'package:fetch_be/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fetch_be/widgets/product_item.dart';
import 'package:fetch_be/providers/product_provider.dart';


class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  static String title = 'Products';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_){
        final repo = ProductRepository(ApiService());
        final provider = ProductsProvider(repo);
        provider.fetchProducts();
        return provider;
      },
      child: Consumer<ProductsProvider>(builder: (_, provider, _) {
        if (provider.isLoading){
          return _buildLoadingState();
        }

        if (provider.error != null){
          return _buildErrorState(provider, provider.error!);
        }

        return _buildSuccessState(provider);
      }),
    );
  }

  Widget _buildSuccessState(ProductsProvider provider) {
    final products = provider.products;
    return RefreshIndicator(
      onRefresh: provider.fetchProducts,
      child: ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
            itemCount: products.length,
            separatorBuilder: (ctx, idx)=> SizedBox(height: 8,),
            itemBuilder: (ctx, idx) {
              final Product currentProduct = products.elementAt(idx);
              return Card(
                child: ProductItem(product: currentProduct),
              );
            },
          ),
    );
  }

  Widget _buildLoadingState(){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 16,),
          Text('Fetching products...')
        ],
      ),
    );
  }

  Widget _buildErrorState(ProductsProvider provider, String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 60, color: Colors.red),
          SizedBox(height: 16),
          Text(
            'Oops! Something went wrong',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              error,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.red),
            ),
          ),
          SizedBox(height: 8,),
          ElevatedButton(
            onPressed: (){
              provider.fetchProducts();
            },
            child: Text('Retry')
          )
        ],
      ),
    );
  }
}