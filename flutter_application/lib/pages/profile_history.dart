import 'package:flutter/material.dart';
import 'package:flutter_application/pages/home.dart';
import 'package:flutter_application/pages/map.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Application',
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileSection(),
            ReceiptHistorySection(),
            RecentlyPurchasedSection(),
            WeeklyOverviewSection(),
            CategoriesSection(),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavBar(selectedIndex: 2),
    );
  }
}

class ProfileSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        children: [
          const CircleAvatar(radius: 30, backgroundColor: Colors.grey),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('JohnDoe',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text('Last activity: 2 hours ago',
                  style: TextStyle(color: Colors.grey)),
            ],
          )
        ],
      ),
    );
  }
}

class ReceiptHistorySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Receipt History',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Last scanned receipt section - clickable
                  InkWell(
                    onTap: () {
                      // Show the last scanned receipt
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Opening last scanned receipt...'),
                        ),
                      );
                      // You would navigate to receipt detail page here
                    },
                    child: const ListTile(
                      title: Text('Last scanned receipt'),
                      subtitle: Text('2 days ago'),
                      trailing: Icon(Icons.chevron_right),
                    ),
                  ),
                  const Divider(), // Add a divider between sections
                  // View all grocery purchases - clickable
                  InkWell(
                    onTap: () {
                      // Navigate to all grocery purchases
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Viewing all grocery purchases...'),
                        ),
                      );
                      // You would navigate to grocery purchases page here
                    },
                    child: const ListTile(
                      title: Text('Grocery Purchases'),
                      trailing: Text('View all',
                          style: TextStyle(color: Colors.blue)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RecentlyPurchasedSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Recently Purchased',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          SizedBox(
            height: 140, // Set a fixed height
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ProductCard(
                    name: 'Tomatoes',
                    price: '\$2.99',
                    details: 'Fresh Tomatoes',
                    quantity: '1kg'),
                ProductCard(
                    name: 'Milk',
                    price: '\$3.49',
                    details: 'Organic Milk',
                    quantity: '1L'),
                ProductCard(
                    name: 'Eggs',
                    price: '\$4.99',
                    details: 'Free-range',
                    quantity: '12 pcs'),
                ProductCard(
                    name: 'Bread',
                    price: '\$2.49',
                    details: 'Whole Grain',
                    quantity: '500g'),
                ProductCard(
                    name: 'Cheese',
                    price: '\$5.99',
                    details: 'Cheddar',
                    quantity: '250g'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  final String price;
  final String details;
  final String quantity;

  const ProductCard({
    super.key,
    required this.name,
    required this.price,
    required this.details,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150, // Fixed width for consistent sizing
      margin: const EdgeInsets.only(right: 10), // Add spacing between cards
      child: Card(
        elevation: 2, // Add some shadow
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(price, style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(name, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 4),
              Text(details, style: const TextStyle(color: Colors.grey)),
              const SizedBox(height: 4),
              Text('Qty: $quantity',
                  style: const TextStyle(fontWeight: FontWeight.w500)),
            ],
          ),
        ),
      ),
    );
  }
}

class WeeklyOverviewSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Weekly Overview',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Total Spend',
                              style: TextStyle(color: Colors.grey)),
                          Text('\$50',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Items Purchased',
                              style: TextStyle(color: Colors.grey)),
                          Text('15',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoriesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Categories',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Centered pie chart placeholder
                  Container(
                    alignment: Alignment.center,
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [Colors.blue, Colors.green, Colors.orange],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Spending\nBreakdown',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Legend
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildLegendItem('Vegetables', Colors.blue, '40%'),
                      _buildLegendItem('Fruits', Colors.green, '35%'),
                      _buildLegendItem('Protein', Colors.orange, '25%'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLegendItem(String label, Color color, String percentage) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          color: color,
        ),
        const SizedBox(width: 4),
        Text('$label: $percentage'),
      ],
    );
  }
}

// Custom Bottom Navigation Bar
class CustomNavBar extends StatelessWidget {
  final int selectedIndex;

  const CustomNavBar({super.key, required this.selectedIndex});

  void _onItemTapped(BuildContext context, int index) {
    if (index == selectedIndex) return; // Prevent reloading the same page

    Widget nextPage;
    if (index == 0) {
      nextPage = const HomePage();
    } else if (index == 1) {
      nextPage = const MapPage();
    } else {
      nextPage = const ProfilePage();
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => nextPage),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Map'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Colors.blue,
      onTap: (index) => _onItemTapped(context, index),
    );
  }
}
