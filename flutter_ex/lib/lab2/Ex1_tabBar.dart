import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Product {
  final String name;
  final double price;
  final String description;

  Product({
    required this.name,
    required this.price,
    required this.description,
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Product> products = [
    Product(
        name: "iPhone 15",
        price: 999,
        description: "Apple smartphone"),
    Product(
        name: "Samsung S24",
        price: 899,
        description: "Samsung flagship"),
    Product(
        name: "Xiaomi 14",
        price: 699,
        description: "Xiaomi high performance"),
  ];

  Product? selectedProduct;

  List<Tab> generateTabs() {
    return const [
      Tab(text: "Home"),
      Tab(text: "Product Details"),
    ];
  }

  Widget buildHomeTab() {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        var product = products[index];

        return ListTile(
          leading: const Icon(Icons.phone_android),
          title: Text(product.name),
          subtitle: Text("\$${product.price}"),
          onTap: () {
            setState(() {
              selectedProduct = product;
              DefaultTabController.of(context).animateTo(1);
            });
          },
        );
      },
    );
  }

  Widget buildDetailTab() {
    if (selectedProduct == null) {
      return const Center(
        child: Text("Select a product from Home"),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            selectedProduct!.name,
            style: const TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text("Price: \$${selectedProduct!.price}"),
          const SizedBox(height: 10),
          Text("Description: ${selectedProduct!.description}"),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var tabs = generateTabs();

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Product App"),
          bottom: TabBar(tabs: tabs),
        ),
        body: TabBarView(
          children: [
            buildHomeTab(),
            buildDetailTab(),
          ],
        ),
      ),
    );
  }
}