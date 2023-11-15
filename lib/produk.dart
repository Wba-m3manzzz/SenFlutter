import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Product {
  final int id;
  final String title;
  final String subTitle;
  final String price;

  Product(this.id, this.title, this.subTitle, this.price);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Product List"),
          backgroundColor: Colors.purple,
        ),
        body: ProductList(),
      ),
    );
  }
}

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Product> products = [
    Product(1, "Laptop", "High-performance laptop", "10,000,000"),
    Product(2, "Smartphone", "Latest model smartphone", "5,000,000"),
    Product(3, "Smartwatch", "Fitness and health tracker", "2,000,000"),
    Product(4, "Headphones", "Noise-canceling headphones", "1,500,000"),
    Product(5, "Tablet", "Large display tablet", "8,000,000"),
    Product(6, "Camera", "Mirrorless camera", "7,000,000"),
    Product(7, "Gaming Console", "Next-gen gaming console", "4,500,000"),
    Product(8, "Wireless Earbuds", "Bluetooth earbuds", "800,000"),
    Product(9, "4K TV", "Ultra HD Smart TV", "12,000,000"),
    Product(10, "Drones", "High-end camera drones", "6,000,000"),
    Product(11, "Fitness Tracker", "Fitness and activity tracker", "500,000"),
    Product(12, "External Hard Drive", "1TB portable hard drive", "600,000"),
    Product(
        13, "Virtual Reality Headset", "Immersive VR experience", "3,000,000"),
    Product(14, "Printer", "Wireless all-in-one printer", "1,200,000"),
    Product(15, "Bluetooth Speaker", "Portable wireless speaker", "300,000"),
    Product(16, "Electric Toothbrush", "Smart electric toothbrush", "150,000"),
    Product(17, "Robotic Vacuum Cleaner", "Smart vacuum cleaning robot",
        "1,000,000"),
    Product(18, "Wireless Mouse", "Ergonomic wireless mouse", "150,000"),
    Product(19, "Security Camera", "HD security camera system", "800,000"),
    Product(20, "External SSD", "500GB super-fast external SSD", "900,000"),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return getProductUI(products[index]);
      },
    );
  }

  Widget getProductUI(Product product) {
    return ListTile(
      tileColor: Color.fromARGB(255, 232, 232, 232),
      leading: CircleAvatar(
        backgroundColor: Colors.blue,
        child: Text(
          "${product.id}",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      title: Text("${product.title}"),
      subtitle: Text("${product.subTitle}\nPrice: Rp. ${product.price}"),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          // TODO: Implement product deletion logic
          setState(() {
            products.removeWhere((p) => p.id == product.id);
          });
        },
      ),
    );
  }
}
