//import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application/pages/map_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 70, 205, 74),
      appBar: appBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _searchBar(),
          _centerBox(),
          _categoriesText(),
          _categoriesCircle(),
          SizedBox(height: 50),
          _bottomButton()
        ],
      ),
      bottomNavigationBar: _bottomBar(context),

    );
  }

  FloatingActionButton _bottomButton() {
    return FloatingActionButton(
          onPressed: (){print('menu');},
          child: const  Icon(Icons.add),
        );
  }

  BottomAppBar _bottomBar(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: (){print('home');},
            child: const Icon(Icons.home),
          ),
          FloatingActionButton(
            onPressed: (){Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MapPage()),
              );},
            child: const Icon(Icons.map),
          ),
          FloatingActionButton(
            onPressed: (){print('profile');},
            child: const Icon(Icons.account_circle_outlined),
          ),
        ],
      ),
    );
  }

  Container _centerBox() {
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
        // The shopping cart and text part
          child: Column(
            children: [
              _myCartBar(),
              _addItemButton(),
            ],
          ),
        );
  }

  Align _categoriesText() {
    return Align(
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
    );
  }

  Padding _addItemButton() {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: ElevatedButton(
          onPressed: (){print('Adding Items');},
          child: Text('+ Add Items')
        ),
      ),
    );
  }

  Row _myCartBar() {
    return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.shopping_cart,
                size: 40,
              ),
              Text(
                ' My Cart',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          );
  }

  Container _searchBar() {
    return Container(
          margin: EdgeInsets.only(top: 20, left: 20, right: 20),
          decoration: BoxDecoration(
            boxShadow: [
// Adds shadow to the search box
              // BoxShadow(
              //   color: Color(0xff1D1D1D).withOpacity(0.40),
              //   blurRadius: 60,
              //   spreadRadius: 1.0
              // )
            ]
          ),
          
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
                )
              ),

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              )
            ),
          ),
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

class _categoriesCircle extends StatelessWidget {
  const _categoriesCircle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(Icons.circle_outlined, size: 70, color: Color.fromARGB(255, 216, 216, 216)),
        Icon(Icons.circle_outlined, size: 70, color: Color.fromARGB(255, 216, 216, 216)),
        Icon(Icons.circle_outlined, size: 70, color: Color.fromARGB(255, 216, 216, 216)),
        Icon(Icons.circle_outlined, size: 70, color: Color.fromARGB(255, 216, 216, 216)),
      ],
    );
  }
}