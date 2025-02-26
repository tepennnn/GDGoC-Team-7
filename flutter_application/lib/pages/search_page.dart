import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_application/pages/home.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar(context),
      body: Column(
        children: [
          SearchBar(autoFocus: true),
          SizedBox(height: 10),
          recommendation(),
        ],
      ),
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
            Expanded(child: itemBox(1)),
            Expanded(
              child: itemBox(2),
            ),
            Expanded(
              child: itemBox(3),
            )
          ],
        )
      ],
    );
  }

  Column itemBox(int number) {
    return Column(children: [
      Container(
          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xffF7F8F8)),
          height: 100,
          width: 100,
          alignment: Alignment.center,
          child: Placeholder()),
      Text(
        "Item $number",
      )
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
              Navigator.pushReplacement(
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
}
