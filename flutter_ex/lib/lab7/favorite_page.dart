import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ex/lab7/favorite.dart';

class FavoritePage extends StatelessWidget {
  final FavoriteRepository favRepo;

  const FavoritePage({super.key, required this.favRepo});

  @override
  Widget build(BuildContext context) {
    var list = favRepo.items();

    return Scaffold(
      appBar: AppBar(title: const Text("Favorite List")),
      body: list.isEmpty
          ? const Center(child: Text("No favorite products"))
          : ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          var p = list[index];

          return ListTile(
            leading: Image.asset(
              "assets/products_image/${p.imgUrl}",
              width: 60,
            ),
            title: Text(p.name),
            subtitle: Text("${p.price} VND"),
          );
        },
      ),
    );
  }
}