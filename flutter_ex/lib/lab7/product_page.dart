import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ex/lab7/favorite.dart';
import 'package:flutter_ex/lab7/favorite_page.dart';

import '../lab7/product-service.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final ProductService service = ProductService();
  final FavoriteRepository favRepo = FavoriteRepository();

  void toggle(Product p) {
    setState(() {
      favRepo.toggle(p);
    });
  }

  void goToFavorite() {
    if (favRepo.isEmpty()) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => FavoritePage(favRepo: favRepo),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite (${favRepo.count()})"),
        actions: [
          IconButton(
            icon: Icon(
              favRepo.isEmpty()
                  ? Icons.favorite_border
                  : Icons.favorite,
              color: favRepo.isEmpty() ? null : Colors.red,
            ),
            onPressed: favRepo.isEmpty() ? null : goToFavorite,
          )
        ],
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
              bool isFav = favRepo.isFavorite(p);

              return Card(
                child: ListTile(
                  leading: Image.asset(
                    "assets/products_image/${p.imgUrl}",
                    width: 60,
                  ),
                  title: Text(p.name),
                  subtitle: Text("${p.price} VND"),
                  trailing: IconButton(
                    icon: Icon(
                      isFav
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: isFav ? Colors.red : null,
                    ),
                    onPressed: () => toggle(p),
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