class Category {
  late String _name;
  late String _imgUrl;

  Category(this._name, this._imgUrl);

  String get imgUrl => _imgUrl;

  set imgUrl(String value) {
    _imgUrl = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }
}

class Product {
  late String _id;
  late String _name;
  late double _price;
  late String _imgUrl;

  Product(this._id, this._name, this._price, this._imgUrl);

  double get price => _price;

  set price(double value) {
    _price = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  String get imgUrl => _imgUrl;

  set imgUrl(String value) {
    _imgUrl = value;
  }

  // cần override 2 method hashCode và equal này thì mới cho vào Set, Map<Product, xxx> được
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Product && runtimeType == other.runtimeType && _id == other._id;

  @override
  int get hashCode => _id.hashCode;
}

class ProductService {
  var _samsungs = [
    Product(
        "SS101", 'Galaxy Z Fold6', 43990000, 'galaxy-z-fold6-features-kv.webp'),
    Product(
        "SS102", 'Galaxy Z Flip6', 28990000, 'galaxy-z-flip6-features-kv.webp'),
    Product("SS103", 'Samsung Galaxy M55 5G 256GB', 9990000,
        'samsung-galaxy-m55-den-2.jpg'),
    Product("SS104", 'Samsung Galaxy A05 128GB', 3990000,
        'samsung-galaxy-a05-den-1.jpg'),
    Product("SS105", 'Samsung Galaxy Z Flip5 5G 256GB', 15990000,
        'samsung-galaxy-zflip-5-vang-ai.jpg'),
    Product("SS106", 'Samsung Galaxy A15 128GB', 4190000,
        'samsung-galaxy-a15-den-5.jpg'),
  ];

  var _iphones = [
    Product("IP101", 'iPhone 13 128GB', 13990000, 'iphone-13-mini-hong-1.jpg'),
    Product("IP102", 'iPhone 15 Pro Max 256GB', 29490000,
        'iphone-15-promax-trang-1.jpg'),
    Product("IP103", 'iPhone 15 128GB', 19690000, 'iphone-15-xanh-1.jpg'),
    Product("IP104", 'iPhone 11 64GB', 8890000, 'iphone-11-trang-1.jpg'),
  ];

  List<Category> _categories = [
    Category("iPhone", "iphone.jpg"),
    Category("Samsung", "samsung.jpg"),
    Category("Panasonic", "panasonic.png"),
    Category("Blackberry", "blackberry.jfif")
  ];
  Map<String, List<Product>> categoryProductMap = {};

  ProductService() {
    categoryProductMap[_categories[0].name] = _iphones;
    categoryProductMap[_categories[1].name] = _samsungs;
  }

  List<Category> findCategories() {
    return _categories;
  }

  List<Product> findProducts(String categoryName) {
    var list = categoryProductMap[categoryName];
    return list ?? [];
  }
}
