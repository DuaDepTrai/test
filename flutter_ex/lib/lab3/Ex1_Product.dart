import 'package:flutter/material.dart';
import 'product-service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductPage(),
    );
  }
}

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final ProductService service = ProductService();

  List<Product> products = [];

  @override
  void initState() {
    super.initState();

    // Lấy tất cả product từ các category
    var categories = service.findCategories();

    List<Product> allProducts = [];
    for (var c in categories) {
      allProducts.addAll(service.findProducts(c.name));
    }

    products = allProducts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // HEADER IMAGE
          SizedBox(
            height: 200,
            width: double.infinity,
            child: Image.asset(
              "assets/products_image/home.jpg", // header image
              fit: BoxFit.cover,
            ),
          ),

          // TITLE
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: const [
                Icon(Icons.arrow_back),
                SizedBox(width: 10),
                Text(
                  "Go back",
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 5),
                Text(
                  "Products",
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          // PRODUCT LIST
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                var p = products[index];

                return Card(
                  margin:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: ListTile(
                    leading: Image.asset(
                      "assets/products_image/${p.imgUrl}",
                      width: 60,
                      fit: BoxFit.cover,
                    ),
                    title: Text(p.name),
                    subtitle: Text("${p.price} VND"),
                    onTap: () {
                      showProductDialog(context, p);
                    },
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  void showProductDialog(BuildContext context, Product p) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
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