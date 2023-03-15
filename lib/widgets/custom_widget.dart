import 'dart:async';
import 'package:firstactivity/models/api_response.dart';
import 'package:firstactivity/ui/Login%20&%20Register%20Page/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:slide_to_act/slide_to_act.dart';
import '../constants/constants.dart';

class CustomValueRow extends StatelessWidget {
const CustomValueRow({ Key? key }) : super(key: key);

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
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const Login()))
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
        maxLength: 20,
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
          contentPadding: const EdgeInsets.symmetric(vertical: 30),
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
        maxLength: 255,
        obscureText: false,
        controller: controller,                    
      )
    );
  }
}

class CustomTypeField extends StatelessWidget {
final controller;
const CustomTypeField({
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
          contentPadding: const EdgeInsets.symmetric(vertical: 30),
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
        maxLength: 255,
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
              ),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: (){
                  logout().then((value){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const Login()));
                  });
                },
                child: Row(
                  children: [
                    const SizedBox(width: 30),
                    const Icon(LineIcons.removeUser),
                    const SizedBox(width: 30),
                    Text(
                      'Log Out',
                      style: GoogleFonts.fredoka(
                        fontSize: 18,
                      )
                    )
                  ]
                ),
              )
          ]
        ),

      ]
    );
  }
}

class CustomRadio extends StatefulWidget {
const CustomRadio({Key? key }) : super(key: key);

  @override
  _CustomRadioState createState() => _CustomRadioState();
}

class _CustomRadioState extends State<CustomRadio> {
  int selectedValue = 1;
  @override

  void _handleRadioValueChanged(int? value) {
    setState(() {
      selectedValue = value!;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Radio(
          activeColor: ksecColor,
          value: 1, 
          groupValue: selectedValue, 
          onChanged: _handleRadioValueChanged
        ),
        Radio(
          activeColor: ksecColor,
          value: 2, 
          groupValue: selectedValue, 
          onChanged: _handleRadioValueChanged
        ),
        Radio(
          activeColor: ksecColor,
          value: 3, 
          groupValue: selectedValue, 
          onChanged: _handleRadioValueChanged
        ),
        Radio(
          activeColor: ksecColor,
          value: 4, 
          groupValue: selectedValue, 
          onChanged: _handleRadioValueChanged
        ),
        Radio(
          activeColor: ksecColor,
          value: 5, 
          groupValue: selectedValue, 
          onChanged: _handleRadioValueChanged
        ),
      ]
    );
  }
}

class RateTheDishText extends StatelessWidget {
const RateTheDishText({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Text(
      'Rate this dish',
      style: GoogleFonts.fredoka(
      fontSize: 20
      )
    );
  }
}

class SubmitText extends StatelessWidget {
const SubmitText({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Text(
      'Save as Secret',
      style: GoogleFonts.fredoka(
        fontWeight: FontWeight.w500,
        color: Colors.black,
      )
    );
  }
}

class ShareToPublicText extends StatelessWidget {
const ShareToPublicText({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Text(
      'Share to Public',
      style: GoogleFonts.fredoka(
        fontWeight: FontWeight.w500,
        color: Colors.black,
      )
    );
  }
}

class UploadImageText extends StatelessWidget {
const UploadImageText({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Text(
      'Tap to upload image',
      style: GoogleFonts.fredoka(
        color: Colors.red
      ),
    );
  }
}

class ConfirmTextDialog extends StatelessWidget {
const ConfirmTextDialog({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Text(
      'Confirm Deletion?',
      style: GoogleFonts.fredoka(),
    );
  }
}

class ConfirmationTextDialog extends StatelessWidget {
const ConfirmationTextDialog({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Text(
      'Would you like to delete this recipe?',
      style: GoogleFonts.fredoka(),
    );
  }
}

class YesText extends StatelessWidget {
const YesText({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Text(
      'Yes',
      style: GoogleFonts.fredoka(
        color: Colors.black,
        fontWeight: FontWeight.w400
      ),
    );
  }
}

class NoText extends StatelessWidget {
const NoText({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Text(
      'No',
      style: GoogleFonts.fredoka(
        color: Colors.black,
        fontWeight: FontWeight.w400
      ),
    );
  }
}

class EricksonText extends StatelessWidget {
const EricksonText({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Text(
      'Erickson',
      style: GoogleFonts.fredoka(
      fontWeight: FontWeight.w400,
      fontSize: 18
      )
    );
  }
}

class CustomImageWidget extends StatelessWidget {
final image;
const CustomImageWidget({ 
  required this.image,
  Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      width: 180,
      height: 180,
      margin: const EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        image: image
      ),
    );
  }
}

class FirstCustomRadio extends StatelessWidget {
final groupValue;
final onChanged;
const FirstCustomRadio({
  required this.groupValue,
  required this.onChanged, 
  Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Radio(
      activeColor: ksecColor,
      value: 1, 
      groupValue: groupValue, 
      onChanged: onChanged
    );
  }
}

class SecondCustomRadio extends StatelessWidget {
final groupValue;
final onChanged;
const SecondCustomRadio({
  required this.groupValue,
  required this.onChanged, 
  Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Radio(
      activeColor: ksecColor,
      value: 2, 
      groupValue: groupValue, 
      onChanged: onChanged
    );
  }
}

class ThirdCustomRadio extends StatelessWidget {
final groupValue;
final onChanged;
const ThirdCustomRadio({
  required this.groupValue,
  required this.onChanged, 
  Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Radio(
      activeColor: ksecColor,
      value: 3, 
      groupValue: groupValue, 
      onChanged: onChanged
    );
  }
}

class FourthCustomRadio extends StatelessWidget {
final groupValue;
final onChanged;
const FourthCustomRadio({
  required this.groupValue,
  required this.onChanged, 
  Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Radio(
      activeColor: ksecColor,
      value: 4, 
      groupValue: groupValue, 
      onChanged: onChanged
    );
  }
}

class FifthCustomRadio extends StatelessWidget {
final groupValue;
final onChanged;
const FifthCustomRadio({
  required this.groupValue,
  required this.onChanged, 
  Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Radio(
      activeColor: ksecColor,
      value: 5, 
      groupValue: groupValue, 
      onChanged: onChanged
    );
  }
}

class CustomImageField extends StatelessWidget {
final onTap;
final image;
const CustomImageField({ 
  required this.onTap,
  required this.image,
  Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return InkWell(
      onTap: onTap,
      child: Ink(
        child: Container(
        height: 300,
        width: 450,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 0.1
          )
        ),
        child: Center(
          child: Column(
            children: [
              Expanded(child: image == null ?
              Center(
                child: Column(
                  children: const [
                    SizedBox(height: 130),
                    Icon(LineIcons.upload),
                    UploadImageText()
                  ]
                )
              )
            :Image.file(image,
            width: 450,
            height: 300,
            fit: BoxFit.cover,
            )
            )]
          ) 
        )
      )
      ),
    );
  }
}

class CustomAlertDialog extends StatelessWidget {
final onPressed;
const CustomAlertDialog({
  required this.onPressed, 
  Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return AlertDialog(
        title: const ConfirmTextDialog(),
        content: SingleChildScrollView(
          child: ListBody(
            children:const <Widget>[
              ConfirmationTextDialog()
            ]
          )
        ),
        actions: <Widget>[
          OutlinedButton(
            onPressed: onPressed,
            style: OutlinedButton.styleFrom(
              backgroundColor: ksecColor
            ),
            child: const YesText(),
          ),
          OutlinedButton(
            onPressed: ()=>Navigator.of(context).pop(),
            style: OutlinedButton.styleFrom(
              backgroundColor: ksecColor
            ),
            child: const NoText()
          )
        ]
      );
  }
}

class SubmitButton extends StatelessWidget {
final onPressed;
final child;
const SubmitButton({
  required this.onPressed,
  required this.child, 
  Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: ksecColor
      ), 
      child: child
    );
  }
}

class CustomAddText extends StatelessWidget {
const CustomAddText({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Text(
      'ADD RECIPE',
      style: GoogleFonts.fredoka(
        fontSize: 21
      ),
    );
  }
}