import 'package:firstactivity/home_page.dart';
import 'package:firstactivity/listings.dart';
import 'package:firstactivity/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class RootPage extends StatefulWidget {
  const RootPage({ Key? key }) : super(key: key);

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: const [
          HomePage(),
          Listings(),
          ProfilePage()
        ],
      ),
      bottomNavigationBar: GNav(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        backgroundColor: Colors.blue,
        gap: 8,
        rippleColor:Colors.grey[300]!,
        hoverColor:Colors.grey[100]!,
        activeColor: Colors.black,
        onTabChange: (index){
          setState(() {
            selectedIndex = index;
          });
        },
        tabs: [
          GButton(
            icon: LineIcons.home,
            text: 'Home',
            borderRadius: BorderRadius.circular(20),
          ),
          GButton(
            icon: LineIcons.bookmark,
            text: 'Listings',
            borderRadius: BorderRadius.circular(20),
          ),
          GButton(
            icon: LineIcons.user,
            text: 'Account',
            borderRadius: BorderRadius.circular(20),
          )    
        ],
      ),
    );
  }
}