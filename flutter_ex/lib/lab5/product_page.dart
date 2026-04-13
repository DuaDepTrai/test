import 'package:flutter/material.dart';
import 'product-service.dart';

class ProductPage extends StatelessWidget {
  final Category category;
  final ProductService service = ProductService();

  ProductPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    var products = service.findProducts(category.name);

    return Scaffold(
      body: Column(
        children: [
          // ===== HEADER =====
          SizedBox(
            height: 200,
            width: double.infinity,
            child: Image.asset(
              "assets/products_image/home.jpg",
              fit: BoxFit.cover,
            ),
          ),

          const Padding(
            padding: EdgeInsets.all(10),
            child: Text("Shopping online"),
          ),

          // ===== GO BACK =====
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Go back"),
                ),
                const Text(
                  "Products",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),

          // ===== CONTENT =====
          Expanded(
            child: products.isEmpty
                ? const Placeholder()
                : ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                var p = products[index];

                return Card(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 5),
                  child: ListTile(
                    leading: Image.asset(
                      "assets/products_image/${p.imgUrl}",
                      width: 60,
                      fit: BoxFit.cover,
                    ),
                    title: Text(p.name),
                    subtitle: Text("${p.price} VND"),
                    onTap: () => showDialogProduct(context, p),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  void showDialogProduct(BuildContext context, Product p) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(p.name),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "assets/products_image/${p.imgUrl}",
              height: 120,
            ),
            const SizedBox(height: 10),
            Text("ID: ${p.id}"),
            Text("Price: ${p.price} VND"),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close"),
          )
        ],
      ),
    );
  }
}