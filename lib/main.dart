import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Product {
  String name;
  double price;
  int quantity;

  Product(this.name, this.price, this.quantity);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductList(),
    );
  }
}

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Product> products = [
    Product('Product 1', 10.0, 0),
    Product('Product 2', 15.0, 0),
    Product('Product 3', 20.0, 0),
    Product('Product 4', 20.0, 0),
    Product('Product 5', 20.0, 0),
    Product('Product 6', 20.0, 0),
    Product('Product 7', 20.0, 0),
    Product('Product 8', 20.0, 0),
    Product('Product 9', 20.0, 0),
    Product('Product 10', 20.0, 0),
    Product('Product 11', 20.0, 0),
    Product('Product 12', 20.0, 0),
    Product('Product 13', 20.0, 0),
    Product('Product 14', 20.0, 0),
    Product('Product 15', 20.0, 0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index].name),
            subtitle:
                Text('Price: \$${products[index].price.toStringAsFixed(2)}'),
            trailing: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Count: ${products[index].quantity}',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.justify
                  ),
                  SizedBox(
                    height: 20,
                    width: 72,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                        ),
                        // minimumSize: Size(5, 20),
                      ),
                      onPressed: () {
                        setState(() {
                          products[index].quantity++;
                          if (products[index].quantity == 5) {
                            _showCongratulationsDialog(products[index]);
                          }
                        });
                      },
                      child: Text(
                        "Buy Now",
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.shopping_cart),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CartPage(products),
            ),
          );
        },
      ),
    );
  }

  void _showCongratulationsDialog(Product product) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Congratulations!'),
          content: Text('You\'ve bought 5 ${product.name}!'),
          actions: <Widget>[
            ElevatedButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class CartPage extends StatelessWidget {
  final List<Product> products;

  CartPage(this.products);

  int _calculateTotalQuantity() {
    int totalQuantity = 0;
    for (var product in products) {
      totalQuantity += product.quantity;
    }
    return totalQuantity;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Total Products Bought: ${_calculateTotalQuantity()}'),
            // SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
