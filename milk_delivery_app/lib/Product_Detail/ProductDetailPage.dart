import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  final Map<String, dynamic> product;

  ProductDetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product['name']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(product['imageUrl'], height: 200, fit: BoxFit.cover),
            SizedBox(height: 20),
            Text(
              product['name'],
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              '₹${product['price']}',
              style: TextStyle(fontSize: 20, color: Colors.green),
            ),
            SizedBox(height: 5),
            Text(
              '₹${product['originalPrice']}',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough),
            ),
            SizedBox(height: 10),
            Text(
              product['discount'],
              style: TextStyle(fontSize: 16, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}


