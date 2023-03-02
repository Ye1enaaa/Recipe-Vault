import 'package:flutter/material.dart';
import '../widgets/custom_widget.dart';


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
            children: const[
              SizedBox(height: 40),
              CustomTitle(),
              SizedBox(height: 25),
              CustomSubTitle(),
              SizedBox(height: 650),
              CustomSlide()
            ]
          )
        )
      )
    );
  }
}