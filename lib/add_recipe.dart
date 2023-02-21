import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'constants/constants.dart';

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

  Future <void> postData() async{
    final cuisine = cuisineController.text;
    final ingredients = ingredientsController.text;
    final ratings = ratingsController.text;
    
   var request = http.MultipartRequest('POST', Uri.parse(postRecipeURL))
    ..fields.addAll(
         {
            'cuisine': cuisine,
           'ingredients' : ingredients,
            'ratings' : ratings
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Add Contacts'),
      ),
      body: Form( 
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                  child: TextFormField(
                    validator: (value) {
                      if(value!.isEmpty){
                        return 'Please enter name';
                      }
                    },
                    style: const TextStyle(color: Colors.white),
                    controller: cuisineController,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      labelStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none,
                      labelText: 'Name'
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                  child: TextFormField(
                    validator: (value) {
                      if(value!.isEmpty){
                        return 'Please enter address';
                      }
                    },
                    style: const TextStyle(color: Colors.white),
                    controller: ingredientsController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      labelStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none,
                      labelText: 'Address'
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                  child: TextFormField(
                    validator: (value) {
                      if(value!.isEmpty){
                        return 'Please enter contact number';
                      }
                    },
                    style: const TextStyle(color: Colors.white),
                    controller: ratingsController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none,
                      labelText: 'Contact Number'
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                      onPressed: ()async{
                        if(formKey.currentState!.validate()){
                          setState((){
                            postData();
                          });
                        }
                      },
                      child: const Text('SUBMIT')),
                ),
              ],
            ),
          ),
          ),
      )
    );
  }
}