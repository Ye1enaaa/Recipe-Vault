import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({ Key? key }) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30),
              Center(
                child: Container( 
                  height:200,
                  width: 200,
                decoration: BoxDecoration(
                  border: Border.all(width: 2),
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 2,
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.1)
                    )
                  ],
                  shape: BoxShape.circle,
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/img/gojo.jpg')
                  )
                ),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                'Erickson Dela Cruz',
                style: GoogleFonts.fredoka(
                  fontSize: 24
                ),
              )
            ],
          ),    
        )
      ),
    );
  }
}