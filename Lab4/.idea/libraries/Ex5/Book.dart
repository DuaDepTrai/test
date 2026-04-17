class Book {
  String isbn;
  String name;
  double price;
  String author;

  Book(this.isbn, this.name, this.price, this.author);

  factory Book.fromJSON(Map<String, dynamic> json) {
    return Book(
      json['isbn'],
      json['name'],
      json['price'],
      json['author'],
    );
  }

  Map<String, dynamic> toJSON() {
    return {
      'isbn': isbn,
      'name': name,
      'price': price,
      'author': author
    };
  }

  void hienThi() {
    print("ISBN  : $isbn");
    print("Name  : $name");
    print("Price : $price");
    print("Author: $author");
    print("--------------------");
  }
}