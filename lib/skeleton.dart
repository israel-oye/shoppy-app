import 'package:fetch_be/pages/cart_page.dart';
import 'package:fetch_be/pages/product_page.dart';
import 'package:fetch_be/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Skeleton extends StatefulWidget {
  const Skeleton({super.key});

  @override
  State<Skeleton> createState() => _SkeletonState();
}

class _SkeletonState extends State<Skeleton> {
  int _selectedIndex = 0;
  final _pages = <Widget>[
    ProductsPage(),
    CartPage(),
  ];

  final _titles = <String>[
    ProductsPage.title,
    CartPage.title,
  ];
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (idx){
          setState(() {
            _selectedIndex = idx;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home), 
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Consumer<CartProvider>(
              builder: (context, provider, _){
                return Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Icon(Icons.shopping_cart),
                    if (provider.items.isNotEmpty)
                    Positioned(
                      right: -12,
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
            label: 'Cart'
          ),
        ]
      ),
    );
  }
}