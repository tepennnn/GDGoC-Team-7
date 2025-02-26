//import 'dart:async';

import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_application/pages/home.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool change = false;
  TextEditingController _searchController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: topBar(context),

        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: SearchBar(
                      controller: _searchController,
                      autoFocus: true,
                      onChanged: (value)
                      {
                        setState(() {});
                      },
              )
            ),
            SizedBox(height: 20,),
            _searchController.text.isEmpty
            ? recommendation()
            : results()
          ],
        ));
}

Column results() {
  return Column(
    children: [
      Align(
            alignment: Alignment.topLeft,
            child: Container(
                margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text(
                  "Showing results for ",
                ))),
        Row(
          children: [
            Expanded(
                child: itemBox(1, "result")
                ),
            Expanded(
              child: itemBox(2, "result"),
            ),
            Expanded(
              child: itemBox(3, "result"),
            )
          ],
        )
    ],
  );
}
Column recommendation() {
  return Column(
      children: [
        Align(
            alignment: Alignment.topLeft,
            child: Container(
                margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text(
                  "Recommended for you",
                ))),
        Row(
          children: [
            Expanded(
                child: itemBox(1, "item")
                ),
            Expanded(
              child: itemBox(2, "item"),
            ),
            Expanded(
              child: itemBox(3, "item"),
            )
          ],
        )
      ],
    );
    }
  }

  Column itemBox(int number, String item_name) {
    return Column(children: [
            Container(
                margin: EdgeInsets.fromLTRB(0,10,0,0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffF7F8F8)),
                height: 100,
                width: 100,
                alignment: Alignment.center,
                child: Placeholder()),
            Text(item_name + "$number",)
          ]);
  }

  AppBar topBar(BuildContext context) {
    return AppBar(
        title: Placeholder(
          child: Text("SavvyCart"),
        ),
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
            child: Container(
                margin: EdgeInsets.all(10),
                height: 5,
                width: 5,
                decoration: BoxDecoration(
                  color: Color(0xffF7F8F8),
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: SvgPicture.asset('assets/icons/back_arrow_icon.svg',
                    alignment: Alignment.center, height: 20, width: 20))));
  }