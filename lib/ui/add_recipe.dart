// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';
import 'dart:io';
import 'package:firstactivity/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:line_icons/line_icons.dart';
import '../constants/constants.dart';

class AddRecipe extends StatefulWidget {
  const AddRecipe({ Key? key }) : super(key: key);

  @override
  _AddRecipeState createState() => _AddRecipeState();
}

class _AddRecipeState extends State<AddRecipe> {
  TextEditingController cuisineController = TextEditingController();
  TextEditingController ingredientsController = TextEditingController();
  TextEditingController ratingsController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  int selectedRadio=0;
  var drop = '';

  Future postRecipeData() async{
    var request = http.MultipartRequest('POST', Uri.parse(postRecipeURL));
    request.headers.addAll({'Content-Type': 'multipart/form-data'});
    request.fields.addAll(
      {
        'cuisine': cuisineController.text,
        'ingredients' : ingredientsController.text,
        'ratings' : selectedRadio.toString(),
        'type': drop
      }
    );
    request.files.add(await http.MultipartFile.fromPath('img', image!.path));
    await request.send().then((response){
      if (response.statusCode == 200){
        backtoPrevious();
        setState(() {
          image = null;
          cuisineController.clear();
          ingredientsController.clear();
          selectedRadio = 0;
        });
      }
    });
  }
  
  
  var image;
  final imgpicker = ImagePicker();

  Future imagePicker()async{
    final pick = await imgpicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if(pick != null){
        image = File(pick.path);
      }
    }
    );
  }

  @override
  void initState() {
    selectedRadio = 0;
    super.initState();
  }

  void backtoPrevious(){
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Recipe added'),
      backgroundColor: ksecColor));
  }
  void thereisError(){
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Please provide details'),
      backgroundColor: ksecColor));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form( 
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 7),
                  Row(
                    children: const[
                      CustomAvatar(),
                      SizedBox(width: 3),
                    ],
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: (){
                      imagePicker();
                    },
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
                                children: [
                                  const SizedBox(height: 130),
                                  const Icon(LineIcons.upload),
                                  Text(
                                    'Tap to upload image',
                                    style: GoogleFonts.fredoka(),
                                  ),
                            ],
                          ))
                          :Image.file(image,
                          width: 450,
                          height: 300,
                          fit: BoxFit.cover,
                          )
                          )]
                        ) 
                      )
                    )
                    )
                  ),
                  //inputs
                  const SizedBox(height: 40),
                  CustomDishField(controller: cuisineController),
                  const SizedBox(height: 30),
                  CustomIngredientsField(controller: ingredientsController),
                  const SizedBox(height: 30),
                  Text(
                    'Rate this dish',
                    style: GoogleFonts.fredoka(
                      fontSize: 20
                    )
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Radio(
                        activeColor: ksecColor,
                        value: 1, 
                        groupValue: selectedRadio, 
                        onChanged: (value){
                          setState(() {
                            selectedRadio = value!;
                          });
                        }
                      ),
                      Radio(
                        activeColor: ksecColor,
                        value: 2, 
                        groupValue: selectedRadio, 
                        onChanged: (value){
                           setState(() {
                            selectedRadio = value!;
                          });
                        }
                      ),
                      Radio(
                        activeColor: ksecColor,
                        value: 3, 
                        groupValue: selectedRadio, 
                        onChanged: (value){
                          setState(() {
                            selectedRadio = value!;
                          });
                        }
                      ),
                      Radio(
                        activeColor: ksecColor,
                        value: 4, 
                        groupValue: selectedRadio, 
                        onChanged: (value){
                          setState(() {
                            selectedRadio = value!;
                          });
                        }
                      ),
                      Radio(
                        activeColor: ksecColor,
                        value: 5, 
                        groupValue: selectedRadio, 
                        onChanged: (value){
                          setState(() {
                            selectedRadio = value!;
                          });
                        }
                      ) 
                    ]
                  ),
                  const CustomRow(),
                  const SizedBox(height: 30),
                  OutlinedButton(
                    onPressed: ()async{
                      if(formKey.currentState!.validate()){
                        setState(() {
                          postRecipeData();
                        });
                      }
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    backgroundColor: ksecColor
                    ), 
                    child: Text(
                      'SUBMIT',
                      style: GoogleFonts.fredoka(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      )
                    )
                  )
                ]
              )
            )
          )
        )
      )
    );
  }
}