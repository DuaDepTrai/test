import 'package:flutter/material.dart';
import 'package:flutter_ex/lab10/CartRepository.dart';
import 'product-service.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProductPage(),
  ));
}

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart (${cart.count()})"),
      ),
      body: FutureBuilder<List<Product>>(
        future: service.findAllProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          var list = snapshot.data!;

          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              var p = list[index];
              bool inCart = cart.exists(p);

              return Card(
                child: ListTile(
                  leading: Image.asset(
                    "assets/products_image/${p.imgUrl}",
                    width: 60,
                  ),
                  title: Text(p.name),
                  subtitle: Text("${p.price} VND"),

                  // ICON CART
                  trailing: IconButton(
                    icon: Icon(
                      Icons.shopping_cart,
                      color: inCart ? Colors.blue : null,
                    ),
                    onPressed: inCart
                        ? null // disable
                        : () => addToCart(p),
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