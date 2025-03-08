import 'package:flutter/material.dart';
import 'package:flutter_application/pages/search_page.dart';
import 'package:flutter_application/pages/map.dart';
import 'package:flutter_application/pages/profile_history.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // Parameter for camera button 
  bool _isExpanded = false;
  void _toggleMenu() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 70, 205, 74),
      appBar: appBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _searchBar(),
          _centralBox(),
          _categories(),
          SizedBox(height: 50),
        ],
      ),

      floatingActionButton: SizedBox(
        width: 380, // Adjust width to fit multiple buttons
        height: 200, // Adjust height for spacing
        child: _scanningButton(),
      ),

      bottomNavigationBar: CustomNavBar(selectedIndex: 0),
    );
  }

  Stack _scanningButton() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        if (_isExpanded) ...[
          // Camera Button
          Positioned(
            bottom: 65,  // Adjusted spacing above main button
            right: 120,   
            child: FloatingActionButton(
              heroTag: "camera", 
              onPressed: () {
                print("Camera Clicked!");
              },
              backgroundColor: Colors.blue,
              child: Icon(Icons.camera_alt),
            ),
          ),
          // Menu Button (Above Camera Button)
          Positioned(
            bottom: 65, // Increased spacing to avoid overlap
            right: 200,   
            child: FloatingActionButton(
              heroTag: "menu", 
              onPressed: () {
                print("Menu Clicked!");
              },
              backgroundColor: Colors.green,
              child: Icon(Icons.menu),
            ),
          ),
        ],
        // Main FAB (Toggles Expansion)
        FloatingActionButton(
          onPressed: _toggleMenu,
          child: Icon(_isExpanded ? Icons.close : Icons.add),
        ),
      ],
    );
  }

  Container _searchBar() {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SearchPage()),
          );
        },
        child: AbsorbPointer( // Prevents keyboard from appearing
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color.fromARGB(255, 216, 216, 216),
              contentPadding: EdgeInsets.all(15),
              hintText: 'Search for ingredients',
              prefixIcon: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(
                  Icons.search,
                  size: 30,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ),
    );
  }


  Container _centralBox() {
    return Container(
            width: 400,
            height: 350,
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Colors.white,
              shape: BoxShape.rectangle,
            ),
            child: Column(
              children: [
                // Cart Bar
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.shopping_cart,size: 40,),
                      Text(
                        ' My Cart',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                  ],
                ),
                // Add item button
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: ElevatedButton(
                      onPressed: (){print('Adding Items');},
                      child: Text('+ Add Items')
                    ),
                  ),
                ),
              ],
            ),
          );
  }

  Column _categories() {
    return Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'CATEGORIES',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.circle_outlined, size: 70, color: Color.fromARGB(255, 216, 216, 216)),
                Icon(Icons.circle_outlined, size: 70, color: Color.fromARGB(255, 216, 216, 216)),
                Icon(Icons.circle_outlined, size: 70, color: Color.fromARGB(255, 216, 216, 216)),
                Icon(Icons.circle_outlined, size: 70, color: Color.fromARGB(255, 216, 216, 216)),
              ],
            ),
          ],
        );
  }



  AppBar appBar() {
    return AppBar(
      title: Text(
        "Welcome to Savvy Cart !",
        style: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 25,
        ),
      ),
      centerTitle: true,
    );
  }
}

// Custom Bottom Navigation Bar
class CustomNavBar extends StatelessWidget {
  final int selectedIndex;

  CustomNavBar({required this.selectedIndex});

  void _onItemTapped(BuildContext context, int index) {
    if (index == selectedIndex) return; // Prevent reloading the same page

    Widget nextPage;
    if (index == 0) {
      nextPage = HomePage();
    } else if (index == 1) {
      nextPage = MapPage();
    } else {
      nextPage = ProfilePage();
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
