// ignore_for_file: prefer_typing_uninitialized_variables
import 'dart:io';
import 'package:firstactivity/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
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
  TextEditingController typeController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  int selectedRadio=0;
  String? selectedValue;
  final List<String> _dropdownValues = ['Breakfast', 'Lunch', 'Dinner'];

  Future postRecipeData() async{
    var request = http.MultipartRequest('POST', Uri.parse(postRecipeURL));
    request.headers.addAll({'Content-Type': 'multipart/form-data'});
    request.fields.addAll(
      {
        'cuisine': cuisineController.text,
        'ingredients' : ingredientsController.text,
        'ratings' : selectedRadio.toString(),
        'mealtype': selectedValue.toString()
      }
    );
    request.files.add(await http.MultipartFile.fromPath('img', image!.path));
    var response = await request.send();
      if (response.statusCode == 200){
        dataSuccess();
        setState(() {
          image = null;
          cuisineController.clear();
          ingredientsController.clear();
          typeController.clear();
          selectedRadio = 0;
        });
      }
    print(response.statusCode);
  }
  //https://medium.com/nerd-for-tech/multipartrequest-in-http-for-sending-images-videos-via-post-request-in-flutter-e689a46471ab
  
  
  File? image;
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

  void dataSuccess(){
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Recipe added'),
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
                const CustomAddText(),
                const SizedBox(height: 10),
                InkWell(
                  onTap: imagePicker,
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
                          Expanded(child:image != null ?
                          Image.file(image!,
                            width: 450,
                            height: 300,
                            fit: BoxFit.cover,
                          ):
                          Center(
                            child: Column(
                              children: const [
                                SizedBox(height: 130),
                                Icon(LineIcons.camera, color: kprimaryColor),
                                UploadImageText()
                              ]
                            )
                          )
                          )]
                        ) 
                    )
                    )
                  )
                ),
                // Input Fields
                const SizedBox(height: 40),
                CustomDishField(controller: cuisineController),
                const SizedBox(height: 30),
                CustomIngredientsField(controller: ingredientsController),
                const SizedBox(height: 30),
                DropdownButton<String>(
                value: selectedValue,
                onChanged: (value){
                  setState(() {
                    selectedValue = value as String;
                  });
                },
                items: _dropdownValues.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
                const SizedBox(height: 30),
                const RateTheDishText(),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FirstCustomRadio(groupValue: selectedRadio, 
                    onChanged: (value)=>setState(()=>selectedRadio = value)),
                    SecondCustomRadio(groupValue: selectedRadio, 
                    onChanged: (value)=>setState(()=>selectedRadio = value)),
                    ThirdCustomRadio(groupValue: selectedRadio, 
                    onChanged: (value)=>setState(()=>selectedRadio = value)),
                    FourthCustomRadio(groupValue: selectedRadio, 
                    onChanged: (value)=>setState(()=>selectedRadio = value)),
                    FifthCustomRadio(groupValue: selectedRadio, 
                    onChanged: (value)=>setState(()=>selectedRadio = value)), 
                  ]
                ),
                const CustomValueRow(),
                const SizedBox(height: 30),
                SubmitButton(onPressed:  ()async{
                    if(formKey.currentState!.validate()){
                      setState(() {
                        postRecipeData();
                      });
                    }
                  }, child: const SubmitText())
                ]
              )
            )
          )
        )
      )
    );
  }
}
