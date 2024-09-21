import 'package:flutter/material.dart';

class DahiProductPage extends StatelessWidget {
  final List<Map<String, dynamic>> dahiProducts = [

    {
      'name': 'A2 Buffalo Milk',
      'image': 'asset/ProductCard/img_1.png',
      'price': 99.0,
      'originalPrice': 110.0,
      'discount': '10.0 % off',
    },

    {
      'name': 'Desi Cow Milk',
      'image': 'asset/ProductCard/img_1.png',
      'price': 89.0,
      'originalPrice': 100.0,
      'discount': '11.0 % off',
    },

    {
      'name': 'Desi Cow Milk',
      'image': 'asset/ProductCard/img_1.png',
      'price': 89.0,
      'originalPrice': 100.0,
      'discount': '11.0 % off',
    },

    {
      'name': 'Desi Cow Milk',
      'image': 'asset/ProductCard/img_1.png',
      'price': 89.0,
      'originalPrice': 100.0,
      'discount': '11.0 % off',
    },

    {
      'name': 'Desi Cow Milk',
      'image': 'asset/ProductCard/img_1.png',
      'price': 89.0,
      'originalPrice': 100.0,
      'discount': '11.0 % off',
    },

    {
      'name': 'Desi Cow Milk',
      'image': 'asset/ProductCard/img_1.png',
      'price': 89.0,
      'originalPrice': 100.0,
      'discount': '11.0 % off',
    },

  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(8),
      itemCount: dahiProducts.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.6,
      ),
      itemBuilder: (context, index) {
        var product = dahiProducts[index];
        return Card(
          elevation: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                product['image'],
                height: 60,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      product['name'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 5),
                    Text(
                      product['discount'],
                      style: TextStyle(color: Colors.red, fontSize: 12),
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '₹${product['price']}',
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          '₹${product['originalPrice']}',
                          style: TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[400],
                      foregroundColor: Colors.white,
                      minimumSize: Size(80, 30),
                      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                      textStyle: TextStyle(fontSize: 12),
                    ),
                    onPressed: () {
                      // Handle Add to Cart
                    },
                    child: Text('Add'),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
