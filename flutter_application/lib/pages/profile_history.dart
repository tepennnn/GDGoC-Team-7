import 'package:flutter/material.dart';
import 'package:flutter_application/pages/home.dart';
import 'package:flutter_application/pages/map.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_options.dart';

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
    return Row(
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
    );
  }
}

class ReceiptHistorySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Receipt History',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            ListTile(
                title: Text('Last scanned receipt'),
                subtitle: Text('2 days ago')),
            ListTile(
                title: Text('Grocery Purchases'),
                trailing:
                    Text('View all', style: TextStyle(color: Colors.blue))),
          ],
        ),
      ),
    );
  }
}

class RecentlyPurchasedSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Recently Purchased',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        CarouselSlider(
          options: CarouselOptions(height: 120, enableInfiniteScroll: false),
          items: [
            ProductCard(
                name: 'Tomatoes',
                price: '\$2.99',
                details: 'Fresh Tomatoes 1kg'),
            ProductCard(
                name: 'Milk', price: '\$3.49', details: 'Organic Milk 1L'),
          ]
              .map((item) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    child: item,
                  ))
              .toList(),
        ),
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  final String price;
  final String details;

  const ProductCard(
      {super.key,
      required this.name,
      required this.price,
      required this.details});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(price, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(name, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 4),
            Text(details, style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}

class WeeklyOverviewSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Weekly Overview',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Total Spend', style: TextStyle(color: Colors.grey)),
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
    );
  }
}

class CategoriesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Categories',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const CircleAvatar(radius: 40, backgroundColor: Colors.grey),
            const SizedBox(height: 8),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Vegetables'),
                Text('Fruits'),
                Text('Protein'),
              ],
            ),
          ],
        ),
      ),
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
