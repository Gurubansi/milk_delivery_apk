import 'package:flutter/material.dart';

import 'ButterMilkProduct_Page.dart';
import 'Curd_Page.dart';
import 'Ghee_Page.dart';
import 'HoneyProduct_Page.dart';
import 'Khoya_Page.dart';
import 'Milk_Page.dart';
import 'Paneer_Page.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  int _selectedCategoryIndex = 0;

  final List<String> categories = ['Milk', 'Ghee', 'Paneer', 'Khoya', 'Dahi', 'Butter Milk', 'Honey'];

  final List<String> categoryImages = [

    'asset/CategoryItem/milk.png',
    'asset/CategoryItem/ghee.png',
    'asset/CategoryItem/paneer.png',
    'asset/CategoryItem/img.png',
    'asset/CategoryItem/img_1.png',
    'asset/CategoryItem/img_1.png',
    'asset/CategoryItem/img_1.png',
  ];

  Widget _buildProductPage()
  {
    switch (_selectedCategoryIndex)
    {
      case 0:
        return MilkProductPage();
      case 1:
         return GheeProductPage();
      case 2:
        return PaneerProductPage(); // You should create PaneerProductPage similarly
      case 3:
        return KhoyaProductPage();  // You should create KhoyaProductPage similarly
      case 4:
        return DahiProductPage();   // You should create DahiProductPage similarly
      case 5:
        return ButterMilkProductPage(); // You should create ButterMilkProductPage similarly
      case 6:
         return HoneyProductPage();  // You should create HoneyProductPage similarly
      default:
        return Center(child: Text('No Products Available'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categories[_selectedCategoryIndex]),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: Row(

        children: [
          // Category list on the left
          Container(
            width: MediaQuery.of(context).size.width * 0.25,
            color: Colors.grey[200],
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedCategoryIndex = index;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    color: _selectedCategoryIndex == index
                        ? Colors.red[50]
                        : Colors.transparent,
                    child: Column(
                      children: [
                        Image.asset(
                          categoryImages[index],
                          height: 50,
                        ),
                        SizedBox(height: 5),
                        Text(categories[index]),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // Product page on the right
          Expanded(
            child: _buildProductPage(),
          ),
        ],
      ),
    );
  }
}














// import 'package:flutter/material.dart';
//
// class CategoryPage extends StatefulWidget {
//   @override
//   _CategoryPageState createState() => _CategoryPageState();
// }
//
// class _CategoryPageState extends State<CategoryPage> {
//   int _selectedCategoryIndex = 0;
//
//   final List<String> categories = ['Milk', 'Ghee', 'Paneer', 'Khoya', 'Dahi', 'Butter Milk', 'Honey'];
//
//   final List<String> categoryImages = [
//     'asset/CategoryItem/milk.png',
//     'asset/CategoryItem/paneer.png',
//     'asset/CategoryItem/ghee.png',
//     'asset/CategoryItem/img.png',
//     'asset/CategoryItem/img_1.png',
//     'asset/CategoryItem/img_1.png',
//     'asset/CategoryItem/img_1.png',
//   ];
//
//   // Products for Milk category
//   final List<Map<String, dynamic>> milkProducts = [
//     {
//       'name': 'A2 Buffalo Milk',
//       'image': 'asset/ProductCard/img_1.png',
//       'price': 99.0,
//       'originalPrice': 110.0,
//       'discount': '10.0 % off'
//     },
//     {
//       'name': 'Desi Cow Milk',
//       'image': 'asset/ProductCard/img_1.png',
//       'price': 99.0,
//       'originalPrice': 110.0,
//       'discount': '10.0 % off'
//     },
//     // Add more milk products
//   ];
//
//   // Products for Ghee category
//   final List<Map<String, dynamic>> gheeProducts = [
//     {
//       'name': 'Pure Ghee',
//       'image': 'asset/ProductCard/img_1.png',
//       'price': 500.0,
//       'originalPrice': 550.0,
//       'discount': '9.0 % off'
//     },
//     // Add more ghee products
//   ];
//
//   // Products for Paneer category
//   final List<Map<String, dynamic>> paneerProducts = [
//     {
//       'name': 'Fresh Paneer',
//       'image': 'asset/ProductCard/img_1.png',
//       'price': 200.0,
//       'originalPrice': 220.0,
//       'discount': '8.0 % off'
//     },
//     // Add more paneer products
//   ];
//
//   // Similarly, create product lists for other categories (Khoya, Dahi, etc.)
//
//   List<Map<String, dynamic>> currentProducts = [];
//
//   @override
//   void initState() {
//     super.initState();
//     currentProducts = milkProducts; // Default to show milk products initially
//   }
//
//   void updateProductList(int index) {
//     setState(() {
//       _selectedCategoryIndex = index;
//       switch (index) {
//         case 0:
//           currentProducts = milkProducts;
//           break;
//         case 1:
//           currentProducts = gheeProducts;
//           break;
//         case 2:
//           currentProducts = paneerProducts;
//           break;
//       // Add cases for other categories (Khoya, Dahi, etc.)
//         default:
//           currentProducts = [];
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(categories[_selectedCategoryIndex]),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: Row(
//         children: [
//           // Category list on the left
//           Container(
//             width: MediaQuery.of(context).size.width * 0.25,
//             color: Colors.grey[200],
//             child: ListView.builder(
//               itemCount: categories.length,
//               itemBuilder: (context, index) {
//                 return GestureDetector(
//                   onTap: () {
//                     updateProductList(index);
//                   },
//                   child: Container(
//                     padding: EdgeInsets.all(8),
//                     color: _selectedCategoryIndex == index
//                         ? Colors.red[50]
//                         : Colors.transparent,
//                     child: Column(
//                       children: [
//                         Image.asset(
//                           categoryImages[index],
//                           height: 50,
//                         ),
//                         SizedBox(height: 5),
//                         Text(categories[index]),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           // Product grid on the right
//           Expanded(
//             child: GridView.builder(
//               padding: EdgeInsets.all(8),
//               itemCount: currentProducts.length,
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 10,
//                 mainAxisSpacing: 10,
//                 childAspectRatio: 0.6, // Adjust height
//               ),
//               itemBuilder: (context, index) {
//                 return Card(
//                   elevation: 2,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Image.asset(
//                         currentProducts[index]['image'],
//                         height: 60,
//                         fit: BoxFit.cover,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Text(
//                               currentProducts[index]['name'],
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 12,
//                               ),
//                               textAlign: TextAlign.center,
//                             ),
//                             SizedBox(height: 5),
//                             Text(
//                               currentProducts[index]['discount'],
//                               style: TextStyle(color: Colors.red, fontSize: 12),
//                             ),
//                             SizedBox(height: 5),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   '₹${currentProducts[index]['price']}',
//                                   style: TextStyle(
//                                     color: Colors.green,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 14,
//                                   ),
//                                 ),
//                                 SizedBox(width: 10),
//                                 Text(
//                                   '₹${currentProducts[index]['originalPrice']}',
//                                   style: TextStyle(
//                                     color: Colors.grey,
//                                     decoration: TextDecoration.lineThrough,
//                                     fontSize: 12,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                       Spacer(),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                         child: SizedBox(
//                           width: double.infinity,
//                           child: ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.green,
//                               minimumSize: Size(80, 30),
//                               padding: EdgeInsets.symmetric(
//                                   vertical: 4, horizontal: 10),
//                               textStyle: TextStyle(fontSize: 12),
//                             ),
//                             onPressed: () {
//                               // Handle Add to Cart
//                             },
//                             child: Text('Add'),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


















//original code
//
// import 'package:flutter/material.dart';
//
// class CategoryPage extends StatefulWidget {
//   @override
//   _CategoryPageState createState() => _CategoryPageState();
// }
//
// class _CategoryPageState extends State<CategoryPage> {
//   int _selectedCategoryIndex = 0;
//
//   final List<String> categories = ['Milk', 'Ghee', 'Paneer', 'Khoya', 'Dahi', 'Butter Milk', 'Honey'];
//
//   final List<String> categoryImages = [
//     'asset/CategoryItem/milk.png',
//     'asset/CategoryItem/paneer.png',
//     'asset/CategoryItem/ghee.png',
//     'asset/CategoryItem/img.png',
//     'asset/CategoryItem/img_1.png',
//     'asset/CategoryItem/img_1.png',
//     'asset/CategoryItem/img_1.png',
//   ];
//
//   final List<Map<String, dynamic>> products = [
//     {
//       'name': 'A2 Buffalo Milk',
//       'image': 'asset/ProductCard/img_1.png',
//       'price': 99.0,
//       'originalPrice': 110.0,
//       'discount': '10.0 % off'
//     },
//
//     {
//       'name': 'Desi Cow Milk',
//       'image': 'asset/ProductCard/img_1.png',
//       'price': 99.0,
//       'originalPrice': 110.0,
//       'discount': '10.0 % off'
//     },
//
//     {
//       'name': 'SahiwalCow Milk',
//       'image': 'asset/ProductCard/img_1.png',
//       'price': 130.0,
//       'originalPrice': 150.0,
//       'discount': '13.0 % off'
//     },
//
//     {
//       'name': 'A2 Gir Cow Milk',
//       'image': 'asset/ProductCard/img_1.png',
//       'price': 143.0,
//       'originalPrice': 160.0,
//       'discount': '11.0 % off'
//     },
//
//     {
//       'name': 'A2 Gir Cow Milk',
//       'image': 'asset/ProductCard/img_1.png',
//       'price': 143.0,
//       'originalPrice': 160.0,
//       'discount': '11.0 % off'
//     },
//
//     {
//       'name': 'A2 Gir Cow Milk',
//       'image': 'asset/ProductCard/img_1.png',
//       'price': 143.0,
//       'originalPrice': 160.0,
//       'discount': '11.0 % off'
//     },
//     // Add more products as needed
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(categories[_selectedCategoryIndex]),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: Row(
//         children: [
//           // Category list on the left
//           Container(
//             width: MediaQuery.of(context).size.width * 0.25,
//             color: Colors.grey[200],
//             child: ListView.builder(
//               itemCount: categories.length,
//               itemBuilder: (context, index) {
//                 return GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       _selectedCategoryIndex = index;
//                     });
//                   },
//                   child: Container(
//                     padding: EdgeInsets.all(8),
//                     color: _selectedCategoryIndex == index
//                         ? Colors.red[50]
//                         : Colors.transparent,
//                     child: Column(
//                       children: [
//                         Image.asset(
//                           categoryImages[index],
//                           height: 50,
//                         ),
//
//                         SizedBox(height: 5),
//
//                         Text(categories[index]),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           // Product grid on the right
//           Expanded(
//             child: GridView.builder(
//               padding: EdgeInsets.all(8),
//               itemCount: products.length,
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 10,
//                 mainAxisSpacing: 10,
//                 childAspectRatio: 0.6, // Adjust height
//               ),
//               itemBuilder: (context, index) {
//
//                 return Card(
//                   elevation: 2,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Image.asset(
//                         products[index]['image'],
//                         height: 60,
//                         fit: BoxFit.cover,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//
//                             Text(
//                               products[index]['name'],
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 12, // Reduced font size
//                               ),
//                               textAlign: TextAlign.center,
//                             ),
//
//                             SizedBox(height: 5),
//
//                             Text(
//                               products[index]['discount'],
//                               style: TextStyle(
//                                   color: Colors.red, fontSize: 12),
//                             ),
//
//                             SizedBox(height: 5),
//
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   '₹${products[index]['price']}',
//                                   style: TextStyle(
//                                     color: Colors.green,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 14, // Adjust font size if needed
//                                   ),
//                                 ),
//
//                                 SizedBox(width: 10),
//
//                                 Text(
//                                   '₹${products[index]['originalPrice']}',
//                                   style: TextStyle(
//                                     color: Colors.grey,
//                                     decoration: TextDecoration.lineThrough,
//                                     fontSize: 12, // Adjust font size if needed
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                       Spacer(),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                         child: SizedBox(
//                           width: double.infinity,
//                           child: ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.green,
//                               minimumSize: Size(80, 30), // Smaller size
//                               padding: EdgeInsets.symmetric(
//                                   vertical: 4, horizontal: 10), // Adjust padding
//                               textStyle: TextStyle(fontSize: 12), // Smaller text
//                             ),
//                             onPressed: () {
//                               // Handle Add to Cart
//                             },
//                             child: Text('Add'),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }













