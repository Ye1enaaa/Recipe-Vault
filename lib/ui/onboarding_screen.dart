import 'dart:async';
import 'package:firstactivity/constants/constants.dart';
import 'package:firstactivity/ui/root_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:slide_to_act/slide_to_act.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({ Key? key }) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/img/back.jpg'),
              fit: BoxFit.cover
            )
          ),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Row(
                children: [
                  const SizedBox(width: 150),
                  Text(
                      'Recipe Vault',
                      style: GoogleFonts.fredoka(
                        fontSize: 30
                      )
                    ),
                ],
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  const SizedBox(width: 40),
                  Column(
                    children: [
                      Text(
                          'Capture every flavor and memory with ease-',
                          style: GoogleFonts.fredoka(
                            fontSize: 18
                          )
                        ),
                        Text(
                          'keep track of your culinary adventures with a recipe diary app.',
                          style: GoogleFonts.fredoka(
                            fontSize: 15
                          )
                        ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 650),
              SlideAction(
                outerColor: ksecColor,
                  sliderButtonIcon: const Icon(
                    LineIcons.arrowRight,
                    size: 20,
                  ),
                  text: 'GET STARTED',
                  textStyle: GoogleFonts.fredoka(
                    fontSize: 18
                  ),
                  onSubmit: ()
                  {
                    Timer(const Duration(milliseconds: 500), () => 
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const RootPage()))
                    );
                  },
              )
            ],
          ),
        ),
      )
    );
  }
}