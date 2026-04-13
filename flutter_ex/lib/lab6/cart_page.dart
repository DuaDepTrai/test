import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ex/lab6/cart_item.dart';

class CartPage extends StatelessWidget {
  final CartRepository cart;

  const CartPage({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    var items = cart.getItems();

    return Scaffold(
      appBar: AppBar(title: const Text("Cart Detail")),
      body: items.isEmpty
          ? const Center(child: Text("Cart is empty"))
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                var item = items[index];

                return ListTile(
                  leading: Image.asset(
                    "assets/products_image/${item.product.imgUrl}",
                    width: 50,
                  ),
                  title: Text(item.product.name),
                  subtitle: Text(
                      "Qty: ${item.quantity} - ${item.product.price} VND"),
                  trailing: Text(
                    "${item.product.price * item.quantity} VND",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                );
              },
            ),
          ),

          // TOTAL
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              "Total: ${cart.totalPrice()} VND",
              style: const TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}