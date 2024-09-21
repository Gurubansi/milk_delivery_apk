import 'package:flutter/material.dart';

import 'ProfilePage.dart';
 // Import the new profile page

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text(
            'Personal info',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 10),
          buildMenuItem(
            icon: Icons.person_outline,
            label: 'Profile',
            onTap: () {
              // Navigate to the Profile page
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
          buildMenuItem(
            icon: Icons.checklist_outlined,
            label: 'Subscriptions',
          ),
          buildMenuItem(
            icon: Icons.inventory_2_outlined,
            label: 'Order',
          ),
          buildMenuItem(
            icon: Icons.house_siding_outlined,
            label: 'Farm Visit',
            hasBadge: true,
          ),
          buildMenuItem(
            icon: Icons.beach_access_outlined,
            label: 'Vacations',
          ),
          buildMenuItem(
            icon: Icons.calendar_today_outlined,
            label: 'Calendar',
          ),
          buildMenuItem(
            icon: Icons.account_balance_wallet_outlined,
            label: 'Wallet',
          ),
          buildMenuItem(
            icon: Icons.receipt_long_outlined,
            label: 'Monthly Bill',
          ),

          SizedBox(height: 20),

          Divider(),
          SizedBox(height: 10),

          Text(
            'Other info',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),

          SizedBox(height: 10),

          buildMenuItem(
            icon: Icons.group_add_outlined,
            label: 'Refer & Earn',
          ),
          buildMenuItem(
            icon: Icons.help_outline,
            label: 'Help & Support',
          ),
          buildMenuItem(
            icon: Icons.local_offer_outlined,
            label: 'Offers',
          ),

          SizedBox(height: 20),

          Divider(),
          SizedBox(height: 10),

          Text(
            'Legal',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),

          SizedBox(height: 10),

          buildMenuItem(
            icon: Icons.privacy_tip_outlined,
            label: 'Privacy & Policy',
          ),
          buildMenuItem(
            icon: Icons.article_outlined,
            label: 'Terms & Conditions',
          ),
          buildMenuItem(
            icon: Icons.sync_outlined,
            label: 'Refund Policy',
          ),
          buildMenuItem(
            icon: Icons.info_outline,
            label: 'V1.5.2',
          ),
        ],
      ),
    );
  }

  Widget buildMenuItem({required IconData icon, required String label, bool hasBadge = false, VoidCallback? onTap}) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.blue[50],
        child: Icon(
          icon,
          color: Colors.blue,
        ),
      ),
      title: Text(label),
      trailing: hasBadge
          ? Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          'New',
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      )
          : null,
      onTap: onTap ?? () {
        // Default tap action (can add other actions for other items)
      },
    );
  }
}











// import 'package:flutter/material.dart';
//
// class MenuPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Menu'),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//       ),
//       body: ListView(
//         padding: EdgeInsets.all(16),
//         children: [
//           Text(
//             'Personal info',
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//               color: Colors.grey,
//
//             ),
//           ),
//           SizedBox(height: 10),
//           buildMenuItem(
//             icon: Icons.person_outline,
//             label: 'Profile',
//
//           ),
//           buildMenuItem(
//             icon: Icons.checklist_outlined,
//             label: 'Subscriptions',
//           ),
//           buildMenuItem(
//             icon: Icons.inventory_2_outlined,
//             label: 'Order',
//           ),
//           buildMenuItem(
//             icon: Icons.house_siding_outlined,
//             label: 'Farm Visit',
//             hasBadge: true,
//           ),
//           buildMenuItem(
//             icon: Icons.beach_access_outlined,
//             label: 'Vacations',
//           ),
//           buildMenuItem(
//             icon: Icons.calendar_today_outlined,
//             label: 'Calendar',
//           ),
//           buildMenuItem(
//             icon: Icons.account_balance_wallet_outlined,
//             label: 'Wallet',
//           ),
//           buildMenuItem(
//             icon: Icons.receipt_long_outlined,
//             label: 'Monthly Bill',
//           ),
//
//           SizedBox(height: 20),
//
//           Divider(),
//           SizedBox(height: 10),
//
//           Text(
//             'Other info',
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//               color: Colors.grey,
//             ),
//           ),
//
//           SizedBox(height: 10),
//
//           buildMenuItem(
//             icon: Icons.group_add_outlined,
//             label: 'Refer & Earn',
//           ),
//           buildMenuItem(
//             icon: Icons.help_outline,
//             label: 'Help & Support',
//           ),
//           buildMenuItem(
//             icon: Icons.local_offer_outlined,
//             label: 'Offers',
//           ),
//
//           SizedBox(height: 20),
//
//           Divider(),
//           SizedBox(height: 10),
//
//           Text(
//             'Legal',
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//               color: Colors.grey,
//             ),
//           ),
//
//           SizedBox(height: 10),
//
//           buildMenuItem(
//             icon: Icons.privacy_tip_outlined,
//             label: 'Privacy & Policy',
//           ),
//           buildMenuItem(
//             icon: Icons.article_outlined,
//             label: 'Terms & Conditions',
//           ),
//           buildMenuItem(
//             icon: Icons.sync_outlined,
//             label: 'Refund Policy',
//           ),
//           buildMenuItem(
//             icon: Icons.info_outline,
//             label: 'V1.5.2',
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget buildMenuItem({required IconData icon, required String label, bool hasBadge = false}) {
//     return ListTile(
//       leading: CircleAvatar(
//         backgroundColor: Colors.blue[50],
//         child: Icon(
//           icon,
//           color: Colors.blue,
//         ),
//       ),
//       title: Text(label),
//       trailing: hasBadge
//           ? Container(
//         padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//         decoration: BoxDecoration(
//           color: Colors.green,
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Text(
//           'New',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 12,
//           ),
//         ),
//       )
//           : null,
//       onTap: () {
//         // Add navigation logic here
//       },
//     );
//   }
// }
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
