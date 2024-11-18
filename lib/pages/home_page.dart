// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:caffeuiapp/util/coffie_tile.dart';
import 'package:caffeuiapp/util/coffie_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // list of coffe type
  final List coffeType = [
    ["Cappucino", true],
    ["Latte", false],
    ["Black", false],
    ["Tea", false],
  ];

  //---user tapped on coffe types
  void coffeTypeSelected(int index) {
    setState(() {
      for (int i = 0; i < coffeType.length; i++) {
        coffeType[i][1] = false;
      }
      coffeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Icon(Icons.menu),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Icon(Icons.person),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.notification_add), label: ''),
          ],
        ),
        body: Column(
          children: [
            //Find the best coffe for you
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text("Find the best coffee for you",
                  style: GoogleFonts.bebasNeue(fontSize: 56)),
            ),
            SizedBox(
              height: 15,
            ), //SearchBar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Find your coffee .. ',
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade600)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade600)),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: coffeType.length,
                itemBuilder: (context, index) {
                  return CoffieType(
                      coffeeType: coffeType[index][0],
                      isSelected: coffeType[index][1],
                      onTap: () {
                        coffeTypeSelected(index);
                      });
                },
              ),
            ),
            //horizontal listview
            Expanded(
                child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CoffieTile(coffeImagePath: 'lib/images/image01.jpeg', coffeName: 'Latte', coffePrice: '40',),
                CoffieTile(coffeImagePath: 'lib/images/image02.jpg', coffeName: 'Latte', coffePrice: '40',),
                CoffieTile(coffeImagePath: 'lib/images/image03.jpg', coffeName: 'Latte', coffePrice: '40',),
              ],
            ))
          ],
        ));
  }
}
