import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

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
              const SizedBox(height: 10),
              Text(
                'My Profile',
                style: GoogleFonts.fredokaOne(
                  fontWeight: FontWeight.w300,
                  fontSize: 40
                ),
              ),
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
                    image: AssetImage('assets/img/erickson.jpg')
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
              ),
              const SizedBox(height: 5),
              Text(
                '2020301583',
                style: GoogleFonts.fredoka()
              ),
              const SizedBox(height: 40),
              Column(
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 30),
                        const Icon(LineIcons.user),
                        const SizedBox(width: 30),
                        Text(
                          'Erickson Avila Dela Cruz',
                          style: GoogleFonts.fredoka(
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        const SizedBox(width: 30),
                        const Icon(LineIcons.birthdayCake),
                        const SizedBox(width: 30),
                        Text(
                          'November 1, 2001',
                          style: GoogleFonts.fredoka(
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        const SizedBox(width: 30),
                        const Icon(LineIcons.phone),
                        const SizedBox(width: 30),
                        Text(
                          '09659065840',
                          style: GoogleFonts.fredoka(
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        const SizedBox(width: 30),
                        const Icon(LineIcons.facebook),
                        const SizedBox(width: 30),
                        Text(
                          'https://web.facebook.com/EADC.04',
                          style: GoogleFonts.fredoka(
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        const SizedBox(width: 30),
                        const Icon(LineIcons.twitter),
                        const SizedBox(width: 30),
                        Text(
                          'https://twitter.com/Erickson_101',
                          style: GoogleFonts.fredoka(
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        const SizedBox(width: 30),
                        const Icon(LineIcons.instagram),
                        const SizedBox(width: 30),
                        Text(
                          'https://www.instagram.com/erick.son101',
                          style: GoogleFonts.fredoka(
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        const SizedBox(width: 30),
                        const Icon(LineIcons.envelope),
                        const SizedBox(width: 30),
                        Text(
                          'avilasonson@gmail.com',
                          style: GoogleFonts.fredoka(
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
            ],
          ),    
        )
      ),
    );
  }
}