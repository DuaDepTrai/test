import '../lab6/product-service.dart';

class CartItem {
  Product product;
  int quantity;

  CartItem(this.product, {this.quantity = 1});
}

class CartRepository {
  final Map<Product, CartItem> _items = {};

  void add(Product product) {
    if (_items.containsKey(product)) {
      _items[product]!.quantity++;
    } else {
      _items[product] = CartItem(product);
    }
  }

  int totalItems() => _items.length;

  List<CartItem> getItems() => _items.values.toList();

  double totalPrice() {
    return _items.values.fold(
        0, (sum, item) => sum + item.product.price * item.quantity);
  }
}