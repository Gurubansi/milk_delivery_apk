import 'package:flutter/material.dart';

class TrialPackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Your Trial Pack'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cashback Banner
            Container(
              width: double.infinity,
              color: Colors.blue,
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Center(
                child: Text(
                  'Get Your Trial Pack with Upto 30% Cashback',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                'asset/img.png', // Using the image from assets
                fit: BoxFit.cover,
              ),
            ),

            // Product Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'A2 Desi Cow Milk',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Product Description
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Vedic A2 Desi Cow Milk is 100% pure & adulteration-free and is loaded with 30+ essential minerals and vitamins. Milk obtained from humped Indian cows contains 98% A2 protein.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
            ),

            // Feature List (As seen in image)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.verified),
                    title: Text('100% A2 Certified'),
                  ),
                  ListTile(
                    leading: Icon(Icons.local_cafe),
                    title: Text('200+ Gir Cow'),
                  ),
                  ListTile(
                    leading: Icon(Icons.check),
                    title: Text('Adulteration-free'),
                  ),
                ],
              ),
            ),
            // Trial Pack Info (Cost, Size, Price)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Trial Pack Cost: ₹ 285',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Trial Pack Size: 1 LTR x 3 Days',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Trial Price: ₹ 285/-',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            // Date Picker (Start Date)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Start Date',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '09/19/2024', // Default date for the example
                    ),
                  ),
                ],
              ),
            ),
            // Shift Radio Buttons (Morning Shift)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Shift',
                    style: TextStyle(fontSize: 16),
                  ),
                  RadioListTile(
                    value: 'morning',
                    groupValue: 'morning',
                    onChanged: (value) {},
                    title: Text('MORNING (05:30 AM to 09:30 AM)'),
                  ),
                  // You can add more Radio buttons here if needed
                ],
              ),
            ),
            // Start Your Trial Pack Button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Action for starting trial pack
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text(
                    'Start Your Trial Pack',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}













