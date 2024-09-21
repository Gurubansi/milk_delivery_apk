import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final double price;
  final double originalPrice;
  final String discount;

  ProductCard({
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.originalPrice,
    required this.discount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(imageUrl, height: 100, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '₹$price',
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 10),
                    Text(
                      discount,
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  '₹$originalPrice',
                  style: TextStyle(
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[400],
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 8),
              ),
              onPressed: () {},
              child: Text('Add to Cart'),
            ),
          ),
        ],
      ),
    );
  }
}








