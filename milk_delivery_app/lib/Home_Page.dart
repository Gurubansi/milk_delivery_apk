import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'CartPage/Cart_Page.dart';
import 'CategoryPage/CategoryPage.dart';
import 'CategoryPage/Bottom_Nevigation_Bar.dart';
import 'Chat_Page/ChatPage.dart';
import 'Get_Your_Trial_Pack.dart';
import 'Menu_Page/MenuPage.dart';
import 'Product_Detail/ProductCrd.dart';
import 'Product_Detail/ProductDetailPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    CategoryPage(),
    CartPage(),
    ChatPage(),
    MenuPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex == 0
          ? AppBar(
        titleSpacing: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'asset/milk_logo.png',
            height: 50,
          ),
        ),
        title: Expanded(
          child: Container(
            height: 40,
            margin: const EdgeInsets.only(left: 8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for Milk, Ghee, Curd...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: Icon(Icons.search),
                contentPadding: EdgeInsets.symmetric(vertical: 0),
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Stack(
              children: [
                Icon(Icons.shopping_cart),
                Positioned(
                  right: 0,
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.red,
                    child: Text('0', style: TextStyle(fontSize: 12)),
                  ),
                ),
              ],
            ),
            onPressed: () {},
          ),
        ],
      )
          : null,
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      'imageUrl': 'asset/ProductCard/img_1.png',
      'name': 'A2 Buffalo Milk',
      'price': 99.0,
      'originalPrice': 110.0,
      'discount': '10% off',
    },
    {
      'imageUrl': 'asset/ProductCard/img_2.png',
      'name': 'Cow Milk',
      'price': 80.0,
      'originalPrice': 90.0,
      'discount': '12% off',
    },
    {
      'imageUrl': 'asset/ProductCard/img_3.png',
      'name': 'Fresh Paneer',
      'price': 150.0,
      'originalPrice': 180.0,
      'discount': '15% off',
    },
    {
      'imageUrl': 'asset/ProductCard/img_3.png',
      'name': 'Pure Ghee',
      'price': 600.0,
      'originalPrice': 550.0,
      'discount': '9% off',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10),
          CarouselSlider(
            items: [
              'asset/carouselImages/img_4.png',
              'asset/carouselImages/img_3.png',
              'asset/carouselImages/img_5.png',
            ].map(
                  (item) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    item,
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width * 0.9,
                  ),
                );
              },
            ).toList(),
            options: CarouselOptions(
              height: 150,
              autoPlay: true,
              enlargeCenterPage: true,
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[400],
                  padding: EdgeInsets.symmetric(vertical: 10),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TrialPackPage(),
                    ),
                  );
                },
                child: Text(
                  'Get Your Trial Pack',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: CategoryItem('Milk', 'asset/CategoryItem/milk.png'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: CategoryItem('Ghee', 'asset/CategoryItem/ghee.png'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: CategoryItem('Paneer', 'asset/CategoryItem/paneer.png'),
                  ),
                  CategoryItem('Khoya', 'asset/CategoryItem/img_3.png'),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Popular Products',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.65,
              ),
              itemBuilder: (context, index) {
                final product = products[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailPage(product: product),
                      ),
                    );
                  },
                  child: ProductCard(
                    imageUrl: product['imageUrl'],
                    name: product['name'],
                    price: product['price'],
                    originalPrice: product['originalPrice'],
                    discount: product['discount'],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String name;
  final String imageUrl;

  CategoryItem(this.name, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage(imageUrl),
        ),
        SizedBox(height: 5),
        Text(name),
      ],
    );
  }
}











//witout button

// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'CartPage/Cart_Page.dart';
// import 'CategoryPage/CategoryPage.dart';
// import 'CategoryPage/Bottom_Nevigation_Bar.dart';
// import 'Chat_Page/ChatPage.dart';
// import 'Get_Your_Trial_Pack.dart';
// import 'Menu_Page/MenuPage.dart';
//
// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   int _selectedIndex = 0;
//
//   final List<Widget> _pages = [
//     HomeScreen(),
//     CategoryPage(),
//     CartPage(),
//     ChatPage(),
//     MenuPage(),
//   ];
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: _selectedIndex == 0
//           ? AppBar(
//         titleSpacing: 0,
//         leading: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Image.asset(
//             'asset/milk_logo.png',
//             height: 50,
//           ),
//         ),
//         title: Expanded(
//           child: Container(
//             height: 40,
//             margin: const EdgeInsets.only(left: 8.0),
//             child: TextField(
//               decoration: InputDecoration(
//                 hintText: 'Search for Milk, Ghee, Curd...',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 prefixIcon: Icon(Icons.search),
//                 contentPadding: EdgeInsets.symmetric(vertical: 0),
//               ),
//             ),
//           ),
//         ),
//         actions: [
//           IconButton(
//             icon: Stack(
//               children: [
//                 Icon(Icons.shopping_cart),
//                 Positioned(
//                   right: 0,
//                   child: CircleAvatar(
//                     radius: 8,
//                     backgroundColor: Colors.red,
//                     child: Text('0', style: TextStyle(fontSize: 12)),
//                   ),
//                 ),
//               ],
//             ),
//             onPressed: () {},
//           ),
//         ],
//       )
//           : null,
//       body: IndexedStack(
//         index: _selectedIndex,
//         children: _pages,
//       ),
//       bottomNavigationBar: CustomBottomNavigationBar(
//         selectedIndex: _selectedIndex,
//         onItemTapped: _onItemTapped,
//       ),
//     );
//   }
// }
//
// class HomeScreen extends StatelessWidget {
//   final List<Map<String, dynamic>> products = [
//     {
//       'imageUrl': 'asset/ProductCard/img_1.png',
//       'name': 'A2 Buffalo Milk',
//       'price': 99.0,
//       'originalPrice': 110.0,
//       'discount': '10% off',
//     },
//     {
//       'imageUrl': 'asset/ProductCard/img_2.png',
//       'name': 'Cow Milk',
//       'price': 80.0,
//       'originalPrice': 90.0,
//       'discount': '12% off',
//     },
//     {
//       'imageUrl': 'asset/ProductCard/img_3.png',
//       'name': 'Fresh Paneer',
//       'price': 150.0,
//       'originalPrice': 180.0,
//       'discount': '15% off',
//     },
//     {
//       'imageUrl': 'asset/ProductCard/img_3.png',
//       'name': 'Pure Ghee',
//       'price': 600.0,
//       'originalPrice': 550.0,
//       'discount': '9% off',
//     },
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           SizedBox(height: 10),
//           CarouselSlider(
//             items: [
//               'asset/carouselImages/img_4.png',
//               'asset/carouselImages/img_3.png',
//               'asset/carouselImages/img_5.png',
//             ].map(
//                   (item) {
//                 return ClipRRect(
//                   borderRadius: BorderRadius.circular(10.0),
//                   child: Image.asset(
//                     item,
//                     fit: BoxFit.cover,
//                     width: MediaQuery.of(context).size.width * 0.9,
//                   ),
//                 );
//               },
//             ).toList(),
//             options: CarouselOptions(
//               height: 150,
//               autoPlay: true,
//               enlargeCenterPage: true,
//             ),
//           ),
//           SizedBox(height: 10),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.red[400],
//                   padding: EdgeInsets.symmetric(vertical: 10),
//                 ),
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => TrialPackPage(),
//                     ),
//                   );
//                 },
//                 child: Text(
//                   'Get Your Trial Pack',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(right: 20.0),
//                     child: CategoryItem('Milk', 'asset/CategoryItem/milk.png'),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(right: 20.0),
//                     child: CategoryItem('Ghee', 'asset/CategoryItem/ghee.png'),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(right: 20.0),
//                     child: CategoryItem('Paneer', 'asset/CategoryItem/paneer.png'),
//                   ),
//                   CategoryItem('Khoya', 'asset/CategoryItem/img_3.png'),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(height: 10),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8.0),
//             child: Align(
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 'Popular Products',
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: 10),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8.0),
//             child: GridView.builder(
//               shrinkWrap: true,
//               physics: NeverScrollableScrollPhysics(),
//               itemCount: products.length,
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 10,
//                 mainAxisSpacing: 10,
//                 childAspectRatio: 0.65,
//               ),
//               itemBuilder: (context, index) {
//                 final product = products[index];
//                 return GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => ProductDetailPage(
//                           product: product,
//                         ),
//                       ),
//                     );
//                   },
//                   child: ProductCard(
//                     imageUrl: product['imageUrl'],
//                     name: product['name'],
//                     price: product['price'],
//                     originalPrice: product['originalPrice'],
//                     discount: product['discount'],
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
//
// class ProductDetailPage extends StatelessWidget {
//   final Map<String, dynamic> product;
//
//   ProductDetailPage({required this.product});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(product['name']),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Image.asset(product['imageUrl'], height: 200, fit: BoxFit.cover),
//             SizedBox(height: 20),
//             Text(
//               product['name'],
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10),
//             Text(
//               '₹${product['price']}',
//               style: TextStyle(fontSize: 20, color: Colors.green),
//             ),
//             SizedBox(height: 5),
//             Text(
//               '₹${product['originalPrice']}',
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Colors.grey,
//                 decoration: TextDecoration.lineThrough,
//               ),
//             ),
//             SizedBox(height: 10),
//             Text(
//               product['discount'],
//               style: TextStyle(color: Colors.red),
//             ),
//             Spacer(),
//             ElevatedButton(
//               onPressed: () {
//                 // Add to cart functionality
//               },
//               child: Text('Add to Cart'),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.red,
//                 padding: EdgeInsets.symmetric(vertical: 16),
//                 minimumSize: Size(double.infinity, 50),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class CategoryItem extends StatelessWidget {
//   final String name;
//   final String imageUrl;
//
//   CategoryItem(this.name, this.imageUrl);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         CircleAvatar(
//           radius: 40,
//           backgroundImage: AssetImage(imageUrl),
//         ),
//         SizedBox(height: 5),
//         Text(name),
//       ],
//     );
//   }
// }
//
// class ProductCard extends StatelessWidget {
//   final String imageUrl;
//   final String name;
//   final double price;
//   final double originalPrice;
//   final String discount;
//
//   ProductCard({
//     required this.imageUrl,
//     required this.name,
//     required this.price,
//     required this.originalPrice,
//     required this.discount,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 4,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             Image.asset(imageUrl, height: 120),
//             SizedBox(height: 5),
//             Text(
//               name,
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             Spacer(),
//             Text(
//               '₹$price',
//               style: TextStyle(fontSize: 16, color: Colors.green),
//             ),
//             Text(
//               '₹$originalPrice',
//               style: TextStyle(
//                 fontSize: 12,
//                 color: Colors.grey,
//                 decoration: TextDecoration.lineThrough,
//               ),
//             ),
//             SizedBox(height: 5),
//             Text(
//               discount,
//               style: TextStyle(color: Colors.red),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



















//first

// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'CartPage/Cart_Page.dart';
// import 'CategoryPage/CategoryPage.dart';
// import 'CategoryPage/Bottom_Nevigation_Bar.dart';
// import 'Chat_Page/ChatPage.dart';
// import 'Get_Your_Trial_Pack.dart';
// import 'Menu_Page/MenuPage.dart';
//
// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   int _selectedIndex = 0;
//
//   final List<Widget> _pages = [
//     HomeScreen(),
//     CategoryPage(),
//     CartPage(),
//     ChatPage(),
//     MenuPage(),
//   ];
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: _selectedIndex == 0
//           ? AppBar(
//         titleSpacing: 0,
//         leading: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Image.asset(
//             'asset/milk_logo.png',
//             height: 50,
//           ),
//         ),
//         title: Expanded(
//           child: Container(
//             height: 40,
//             margin: const EdgeInsets.only(left: 8.0),
//             child: TextField(
//               decoration: InputDecoration(
//                 hintText: 'Search for Milk, Ghee, Curd...',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 prefixIcon: Icon(Icons.search),
//                 contentPadding: EdgeInsets.symmetric(vertical: 0),
//               ),
//             ),
//           ),
//         ),
//         actions: [
//           IconButton(
//             icon: Stack(
//               children: [
//                 Icon(Icons.shopping_cart),
//                 Positioned(
//                   right: 0,
//                   child: CircleAvatar(
//                     radius: 8,
//                     backgroundColor: Colors.red,
//                     child: Text('0', style: TextStyle(fontSize: 12)),
//                   ),
//                 ),
//               ],
//             ),
//             onPressed: () {},
//           ),
//         ],
//       )
//           : null,
//       body: IndexedStack(
//         index: _selectedIndex,
//         children: _pages,
//       ),
//       bottomNavigationBar: CustomBottomNavigationBar(
//         selectedIndex: _selectedIndex,
//         onItemTapped: _onItemTapped,
//       ),
//     );
//   }
// }
//
// class HomeScreen extends StatelessWidget {
//   final List<Map<String, dynamic>> products = [
//     {
//       'imageUrl': 'asset/ProductCard/img_1.png',
//       'name': 'A2 Buffalo Milk',
//       'price': 99.0,
//       'originalPrice': 110.0,
//       'discount': '10% off',
//     },
//     {
//       'imageUrl': 'asset/ProductCard/img_2.png',
//       'name': 'Cow Milk',
//       'price': 80.0,
//       'originalPrice': 90.0,
//       'discount': '12% off',
//     },
//     {
//       'imageUrl': 'asset/ProductCard/img_3.png',
//       'name': 'Fresh Paneer',
//       'price': 150.0,
//       'originalPrice': 180.0,
//       'discount': '15% off',
//     },
//     {
//       'imageUrl': 'asset/ProductCard/img_3.png',
//       'name': 'Pure Ghee',
//       'price': 600.0,
//       'originalPrice': 550.0,
//       'discount': '9% off',
//     },
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           SizedBox(height: 10),
//           CarouselSlider(
//             items: [
//               'asset/carouselImages/img_4.png',
//               'asset/carouselImages/img_3.png',
//               'asset/carouselImages/img_5.png',
//             ].map(
//                   (item) {
//                 return ClipRRect(
//                   borderRadius: BorderRadius.circular(10.0),
//                   child: Image.asset(
//                     item,
//                     fit: BoxFit.cover,
//                     width: MediaQuery.of(context).size.width * 0.9,
//                   ),
//                 );
//               },
//             ).toList(),
//             options: CarouselOptions(
//               height: 150,
//               autoPlay: true,
//               enlargeCenterPage: true,
//             ),
//           ),
//           SizedBox(height: 10),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.red[400],
//                   padding: EdgeInsets.symmetric(vertical: 10),
//                 ),
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => TrialPackPage(),
//                     ),
//                   );
//                 },
//                 child: Text(
//                   'Get Your Trial Pack',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(right: 20.0),
//                     child: CategoryItem('Milk', 'asset/CategoryItem/milk.png'),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(right: 20.0),
//                     child: CategoryItem('Ghee', 'asset/CategoryItem/ghee.png'),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(right: 20.0),
//                     child: CategoryItem('Paneer', 'asset/CategoryItem/paneer.png'),
//                   ),
//                   CategoryItem('Khoya', 'asset/CategoryItem/img_3.png'),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(height: 10),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8.0),
//             child: Align(
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 'Popular Products',
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: 10),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8.0),
//             child: GridView.builder(
//               shrinkWrap: true,
//               physics: NeverScrollableScrollPhysics(),
//               itemCount: products.length,
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 10,
//                 mainAxisSpacing: 10,
//                 childAspectRatio: 0.65,
//               ),
//               itemBuilder: (context, index) {
//                 final product = products[index];
//                 return ProductCard(
//                   imageUrl: product['imageUrl'],
//                   name: product['name'],
//                   price: product['price'],
//                   originalPrice: product['originalPrice'],
//                   discount: product['discount'],
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class CategoryItem extends StatelessWidget {
//   final String name;
//   final String imageUrl;
//
//   CategoryItem(this.name, this.imageUrl);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         CircleAvatar(
//           radius: 40,
//           backgroundImage: AssetImage(imageUrl),
//         ),
//         SizedBox(height: 5),
//         Text(name),
//       ],
//     );
//   }
// }
//
// class ProductCard extends StatelessWidget {
//   final String imageUrl;
//   final String name;
//   final double price;
//   final double originalPrice;
//   final String discount;
//
//   ProductCard({
//     required this.imageUrl,
//     required this.name,
//     required this.price,
//     required this.originalPrice,
//     required this.discount,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 2,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Image.asset(imageUrl, height: 100, fit: BoxFit.cover),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   name,
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(height: 5),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       '₹$price',
//                       style: TextStyle(
//                           color: Colors.green, fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(width: 10),
//                     Text(
//                       discount,
//                       style: TextStyle(color: Colors.red),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 5),
//                 Text(
//                   '₹$originalPrice',
//                   style: TextStyle(
//                     color: Colors.grey,
//                     decoration: TextDecoration.lineThrough,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Spacer(),
//           SizedBox(
//             width: double.infinity,
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.red[400],
//                 foregroundColor: Colors.white,
//                 padding: EdgeInsets.symmetric(vertical: 8),
//               ),
//               onPressed: () {},
//               child: Text('Add to Cart'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
