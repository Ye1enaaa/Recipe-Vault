import 'dart:convert';
import 'dart:io';
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

  Future postRecipeData() async{
    final cuisine = cuisineController.text;
    final ingredients = ingredientsController.text;
    var request = http.MultipartRequest('POST', Uri.parse(postRecipeURL));
    request.headers.addAll({'Content-Type': 'multipart/form-data'});
    request.fields.addAll(
      {
        'cuisine': cuisine,
        'ingredients' : ingredients,
        'ratings' : selectedRadio.toString()
      }
    );
    request.files.add(await http.MultipartFile.fromPath('img', image!.path));
    var response = await request.send();
    backtoPrevious();
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
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: SingleChildScrollView(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
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
                      ))
                    )
                  ),
                  //inputs
                  const SizedBox(height: 40),
                  Padding(
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
                      obscureText: false,
                      controller: cuisineController,                    
                    )
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Please provide ingredients';
                        }
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
                      controller: ingredientsController,                    
                    )
                  ),
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
                  Row(
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
                  ),
                  const SizedBox(height: 30),
                  OutlinedButton(
                    onPressed: ()async{
                      if(formKey.currentState!.validate()){
                        setState(() {
                          postRecipeData();
                          image = null;
                          cuisineController.clear();
                          ingredientsController.clear();
                          selectedRadio = 0;
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