import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ex/lab6/cart_item.dart';
import 'package:flutter_ex/lab6/cart_page.dart';
import '../lab6/product-service.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final ProductService service = ProductService();
  final CartRepository cart = CartRepository();

  void addToCart(Product p) {
    setState(() {
      cart.add(p);
    });
  }

  void goToCart() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CartPage(cart: cart),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping (${cart.totalItems()})"),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: goToCart,
          )
        ],
      ),
      body: FutureBuilder<List<Product>>(
        future: service.findAllProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          var products = snapshot.data!;

          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              var p = products[index];

              return Card(
                child: ListTile(
                  leading: Image.asset(
                    "assets/products_image/${p.imgUrl}",
                    width: 60,
                    fit: BoxFit.cover,
                  ),
                  title: Text(p.name),
                  subtitle: Text("${p.price} VND"),
                  trailing: IconButton(
                    icon: const Icon(Icons.add_shopping_cart),
                    onPressed: () => addToCart(p),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}