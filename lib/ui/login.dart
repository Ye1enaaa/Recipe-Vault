import 'dart:convert';
import 'package:firstactivity/constants/constants.dart';
import 'package:firstactivity/models/api_response.dart';
import 'package:firstactivity/ui/root_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  Future<ApiResponse> login (String email, String password)async{
  ApiResponse apIresponse = ApiResponse();

  try{
    final response = await http.post(
    Uri.parse(loginURL),
    headers: {'Accept': 'application/json'},
    body: {'email': email, 'password': password}
    );
    switch(response.statusCode){
      case 200:
      apIresponse.data = User.fromJson(jsonDecode(response.body));
      break;
      case 422:
        final errors = jsonDecode(response.body)['errors'];
        apIresponse.error = errors[errors.key.elementAt(0)][0];
      break;
      case 403:
      apIresponse.error = jsonDecode(response.body)['message'];
      break;
      default:
      apIresponse.error = 'Somethin went Wrong';
      break;
    }
  }
  catch(err){
    apIresponse.error = 'Something went Wrong';
  }

  return apIresponse;
}
  void loginNow()async{
    ApiResponse response = await login(nameController.text, passwordController.text);
    if(response.error == null){
      // ignore: use_build_context_synchronously
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const RootPage()));
    }
    else{
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Incorrect Details')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            //height: 600,
            decoration: const BoxDecoration(color: ksecColor),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        IconButton(onPressed: (){}, icon: const Icon(LineIcons.arrowLeft, size: 18)),
                        const SizedBox(width: 290),
                        Text('Register', style: GoogleFonts.fredoka(fontSize: 18))
                      ]
                    )
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 28),
                    child: Row(
                      children: [
                        Text('Login', style: GoogleFonts.fredoka(fontSize: 22, fontWeight: FontWeight.bold)),
                        const SizedBox(width: 60),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(width: 30),
                          Text('Keep track of your culinary creations with ease using Recipe Vault.', style: GoogleFonts.fredoka(fontSize: 14)),
                        ]
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(width: 30),
                          Text('From savory to sweet, never forget a recipe again.', style: GoogleFonts.fredoka(fontSize: 14)),
                        ]
                      ),
                    ],
                  ),
                  const SizedBox(height: 150),
                  Container(
                    height: 566,
                    width: 500,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50))
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 70),
                        SizedBox(
                          width: 350,
                          child: TextFormField(
                            validator: (value){
                              if(value!.isEmpty){
                                return 'Please provide email!';
                              }
                            },
                            decoration: InputDecoration(
                            hintStyle: GoogleFonts.fredoka(),
                            hintText: 'Username',
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(40)
                            ),
                            filled: true
                          ),
                          controller: nameController,
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: 350,
                          child: TextFormField(
                            validator: (value){
                              if(value!.isEmpty){
                                return 'Please provide password!';
                              }
                            },
                            decoration: InputDecoration(
                            hintStyle: GoogleFonts.fredoka(),
                            hintText: 'Password',
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(40)
                            ),
                            filled: true
                          ),
                          controller: passwordController,
                          obscureText: true,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            const SizedBox(width: 290),
                            Text('Forgot Password?', style: GoogleFonts.fredoka(fontSize: 12,decoration: TextDecoration.underline))
                          ]
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: (){
                            if(formKey.currentState!.validate()){
                              loginNow();
                            }
                          },
                          child: Container(
                            height: 60,
                            width: 350,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.black
                            ),
                            child: Center(
                              child: Text('Log In', style: GoogleFonts.fredoka(fontSize: 20,color: Colors.white, fontWeight: FontWeight.w600)),
                            ),
                          ),
                        )
                      ],
                    )
                  )
                ],
              ),
            ),
          ),
        ) 
      ),
    );
  }
}