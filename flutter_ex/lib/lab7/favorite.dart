import '../lab7/product-service.dart';

class FavoriteRepository {
  final Set<Product> _favorites = {};

  void toggle(Product p) {
    if (_favorites.contains(p)) {
      _favorites.remove(p);
    } else {
      _favorites.add(p);
    }
  }

  bool isFavorite(Product p) => _favorites.contains(p);

  int count() => _favorites.length;

  List<Product> items() => _favorites.toList();

  bool isEmpty() => _favorites.isEmpty;
}