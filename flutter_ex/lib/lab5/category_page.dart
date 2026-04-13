import 'package:flutter/material.dart';
import 'product-service.dart';
import 'product_page.dart';

class CategoryPage extends StatelessWidget {
  final ProductService service = ProductService();

  CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    var categories = service.findCategories();

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
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  "Homepage",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text("Shopping online"),
              ],
            ),
          ),

          // ===== GRID CATEGORY =====
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                var c = categories[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProductPage(category: c),
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                        ),
                        child: Image.asset(
                          "assets/products_image/${c.imgUrl}",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          c.name,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              backgroundColor: Colors.white),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}