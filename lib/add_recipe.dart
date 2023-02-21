import 'dart:io';
import 'package:firstactivity/constants/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'constants/constants.dart';

//enum RadioDataEnum {one, two, three, four, five}

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
  Future <void> postData() async{
    final cuisine = cuisineController.text;
    final ingredients = ingredientsController.text;
    //final ratings = ratingsController.text;
    //var drop = '';
   var request = http.MultipartRequest('POST', Uri.parse(postRecipeURL))
    ..fields.addAll(
         {
            'cuisine': cuisine,
           'ingredients' : ingredients,
            'ratings' : selectedRadio.toString()
          })
      ..headers.addAll({'Content-Type': 'multipart/form-data'})
     ..files.add(await http.MultipartFile.fromPath('img', image!.path));
   await request.send();
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
  //RadioDataEnum radiodataEnum = RadioDataEnum.one;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form( 
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  InkWell(
                    onTap: (){
                      imagePicker();
                    },
                    child: Ink(
                      child: Container(
                      height: 300,
                      width: 350,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      child: Center(
                        child: Column(
                          children: [
                          Expanded(child: image == null ?
                         const Center(child: Text('Tap to upload image'))
                          :Image.file(image,
                          width: 350,
                          height: 300,
                          fit: BoxFit.cover,
                          )
                          )],
                        ), 
                      ),
                              ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  //inputs
                  TextFields(
                    controller: cuisineController, 
                    maxLines: 1, 
                    hintText: 'Cuisine', 
                    obscureText: false
                  ),
                  const SizedBox(height: 30),
                  TextFields(
                    controller: ingredientsController, 
                    maxLines: null, 
                    hintText: 'Ingredients', 
                    obscureText: false,
                  ),
                  const SizedBox(height: 30),
                  const Text('Ratings'),
                  //For Rows
                  Row(
                    children: [
                      Radio(
                        value: 1, 
                        groupValue: selectedRadio, 
                        onChanged: (value){
                          setState(() {
                            selectedRadio = value!;
                          });
                        },
                      ),
                      const Text('1'),
                      Radio(
                        value: 2, 
                        groupValue: selectedRadio, 
                        onChanged: (value){
                           setState(() {
                            selectedRadio = value!;
                          });
                        },
                      ),
                      const Text('2'),
                      Radio(
                        value: 3, 
                        groupValue: selectedRadio, 
                        onChanged: (value){
                          setState(() {
                            selectedRadio = value!;
                          });
                        },
                      ),
                      const Text('3'),
                      Radio(
                        value: 4, 
                        groupValue: selectedRadio, 
                        onChanged: (value){
                          setState(() {
                            selectedRadio = value!;
                          });
                        },
                      ),
                      const Text('4'),
                      Radio(
                        value: 5, 
                        groupValue: selectedRadio, 
                        onChanged: (value){
                          setState(() {
                            selectedRadio = value!;
                          });
                        },
                      ),
                      const Text('5')  
                    ],
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    height: 40,
                    child: ElevatedButton(onPressed: (){
                      postData();
                    }, child: const Text('SUBMIT')),
                  )
                ],
              ),
            ),
            ),
        ),
      )
    );
  }
}