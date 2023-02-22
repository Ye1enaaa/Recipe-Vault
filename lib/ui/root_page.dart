import 'package:firstactivity/add_recipe.dart';
import 'package:firstactivity/constants/constants.dart';
import 'package:firstactivity/ui/listings.dart';
import 'package:firstactivity/ui/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      backgroundColor: kprimaryColor,
      body: IndexedStack(
        index: selectedIndex,
        children: const [
          Listings(),
          AddRecipe(),
          ProfilePage()
        ],
      ),
      bottomNavigationBar: GNav(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        backgroundColor: Colors.white,
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
            icon: LineIcons.bookmark,
            text: 'Listings',
            borderRadius: BorderRadius.circular(20),
            textStyle: GoogleFonts.fredoka(),
            iconActiveColor: ksecColor,
          ),
          GButton(
            icon: LineIcons.plusCircle,
            text: 'Add Recipe',
            borderRadius: BorderRadius.circular(20),
            textStyle: GoogleFonts.fredoka(),
            iconActiveColor: ksecColor,
          ),
          GButton(
            icon: LineIcons.user,
            text: 'Account',
            borderRadius: BorderRadius.circular(20),
            textStyle: GoogleFonts.fredoka(),
            iconActiveColor: ksecColor,
          )
          ],
      ),
    );
  }
}