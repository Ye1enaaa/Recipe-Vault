import 'package:firstactivity/mealtypewidgets/breakfast_tab.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../mealtypewidgets/dinner_tab.dart';
import '../mealtypewidgets/lunch_tab.dart';

class Listings extends StatefulWidget {
  const Listings({ Key? key }) : super(key: key);

  @override
  _ListingsState createState() => _ListingsState();
}

class _ListingsState extends State<Listings> with SingleTickerProviderStateMixin{
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white10,
        title: Text(
          "Favorites",
          style: GoogleFonts.ubuntu(
            fontSize: 22, fontWeight: FontWeight.w500,
            color: Colors.black
          )
        ),
        bottom: TabBar(
          controller: tabController,
          tabs: [
            Tab(child: Text('Breakfast', style: GoogleFonts.fredoka(color:Colors.black))),
            Tab(child: Text('Lunch', style: GoogleFonts.fredoka(color:Colors.black))),
            Tab(child: Text('Dinner', style: GoogleFonts.fredoka(color:Colors.black)))
          ]
        )
      ),
      body: TabBarView(
        controller: tabController,
        children: const [
          BreakfastTab(),
          LunchTab(),
          DinnerTab()
        ]
      )
    );
  } 
}