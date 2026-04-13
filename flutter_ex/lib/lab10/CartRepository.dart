import '../lab10/product-service.dart';

class CartRepository {
  final Set<Product> _items = {};

  void add(Product p) {
    _items.add(p); // Set → không duplicate
  }

  bool exists(Product p) => _items.contains(p);

  int count() => _items.length;
}