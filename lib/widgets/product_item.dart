import 'package:fetch_be/models/product.dart';
import 'package:fetch_be/pages/item_page.dart';
import 'package:fetch_be/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatefulWidget {
  final Product product;

  const ProductItem({super.key, required this.product});

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CartProvider>();
    return ListTile(
      leading: CircleAvatar(backgroundColor: widget.product.color,),
      title: Text(widget.product.name),
      subtitle: Text('₦ ${widget.product.price.toStringAsFixed(2)}'),
      trailing: Checkbox(
        value: provider.items.contains(widget.product),
        onChanged: (val){
          if (val == true) {
            provider.addToCart(widget.product);
          } else {
            provider.removeItem(widget.product);
          }
        }
      ),
      // trailing: Row(
      //   mainAxisSize: MainAxisSize.min,
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     IconButton(
      //       onPressed: (){}, 
      //       icon: Icon(Icons.add),
      //     ),
      //     SizedBox(width: 6,),
      //     Container(
      //       padding: const EdgeInsets.all(6),
      //       decoration: BoxDecoration(
      //         shape: BoxShape.circle,
      //         border: Border.all(
      //           color: Theme.of(context).colorScheme.primaryContainer,
      //           width: 1.5,
      //         ),
      //       ),
      //       child: IconButton(
      //         icon: const Icon(
      //           Icons.arrow_forward_ios,
      //           size: 16,
      //         ),
      //         onPressed: (){
      //           Navigator.push(
      //             context, 
      //             MaterialPageRoute(builder: (_)=>ItemPage(item: product))
      //           );
      //         },
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}