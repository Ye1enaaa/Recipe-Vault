import 'dart:async';
import 'package:firstactivity/ui/root_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'constants/constants.dart';

class CustomRow extends StatelessWidget {
const CustomRow({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children:[
        Text(
          '1',
          style: GoogleFonts.fredoka()
        ),
        Text(
          '2',
          style: GoogleFonts.fredoka()
        ),
        Text(
          '3',
          style: GoogleFonts.fredoka()
        ),
        Text(
          '4',
          style: GoogleFonts.fredoka()
        ),
        Text(
          '5',
          style: GoogleFonts.fredoka()
        )  
      ]
    );
  }
}

class CustomSubTitle extends StatelessWidget {
const CustomSubTitle({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Row(
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
            )
          ]
        )
      ]
    );
  }
}

class CustomSlide extends StatelessWidget {
const CustomSlide({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return SlideAction(
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
    );
  }
}
class CustomTitle extends StatelessWidget {
const CustomTitle({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Row(
      children: [
        const SizedBox(width: 150),
        Text(
          'Recipe Vault',
          style: GoogleFonts.fredoka(
            fontSize: 30
          )
        )
      ]
    );
  }
}

class CustomAvatar extends StatelessWidget {
const CustomAvatar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: AssetImage('assets/img/erickson.jpg'),
        )
      )
    );
  }
}

class CustomDishField extends StatelessWidget {
final controller;
const CustomDishField({
  required this.controller, 
  Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(
        validator: (value){
          if(value!.isEmpty){
            return 'Please provide dish name';
          }
        },
        decoration: InputDecoration(
          hintStyle: GoogleFonts.fredoka(),
          hintText: 'Dish name',
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white)
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400)
          ),
          filled: true
        ),
        maxLines: 1,
        controller: controller,                    
      )
    );
  }
}

class CustomIngredientsField extends StatelessWidget {
final controller;
const CustomIngredientsField({
  required this.controller, 
  Key? key 
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(
        validator: (value){
          if(value!.isEmpty){
            return 'Please provide ingredients';
          }
          return null;
        },
        decoration: InputDecoration(
          hintStyle: GoogleFonts.fredoka(),
          hintText: 'Ingredients',
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white)
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400)
          ),
          filled: true
        ),
        maxLines: null,
        obscureText: false,
        controller: controller,                    
      )
    );
  }
}

class CustomListingAvatar extends StatelessWidget {
const CustomListingAvatar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: AssetImage('assets/img/erickson.jpg'),
        )
      )
    );
  }
}

class ProfileDescription extends StatelessWidget {
const ProfileDescription({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        const SizedBox(height: 10),
        Text(
          'My Profile',
          style: GoogleFonts.fredokaOne(
            fontWeight: FontWeight.w100,
            fontSize: 40,
          )
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
          )
          )
        ),
        const SizedBox(height: 15),
        Text(
          'Erickson Dela Cruz',
          style: GoogleFonts.fredoka(
            fontSize: 24
          )
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
                    )
                  )
                ]
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
                    )
                  )
                ]
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
                    )
                  )
                ]
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
                    )
                  )
                ]
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
                    )
                  )
                ]
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
                    )
                  )
                ]
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
                    )
                  )
                ]
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  const SizedBox(width: 30),
                  const Icon(LineIcons.github),
                  const SizedBox(width: 30),
                  Text(
                    'https://github.com/Ye1enaaa',
                    style: GoogleFonts.fredoka(
                      fontSize: 18,
                    )
                  )
                ]
              )
          ]
        )
      ]
    );
  }
}
