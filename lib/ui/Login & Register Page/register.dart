import 'dart:convert';
import 'package:firstactivity/ui/Login%20&%20Register%20Page/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import '../../constants/constants.dart';
import '../../models/api_response.dart';
import 'package:http/http.dart' as http;
class Register extends StatefulWidget {
  const Register({ Key? key }) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConFController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  Future<ApiResponse> register(String name, String email, String password)async{
  ApiResponse apIresponse = ApiResponse();
  try{
    final response = await http.post(
    Uri.parse(registerURL),
    headers: {'Accept': 'application/json'},
    body: {
    'name': name,
    'email': email, 
    'password': password,
    }
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
      apIresponse.error = 'Error';
      break;
    }
  }
  catch(err){
    apIresponse.error = 'Server Error';
  }

  return apIresponse;
}
  void registerUser() async{
    ApiResponse response = await register(nameController.text, emailController.text, passwordController.text);
    if(response.error == null){
         callMe();
      }
      else{
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Email Already Taken')));
      }
  }

  void callMe()async{
    Navigator.push(context, MaterialPageRoute(builder: (context)=> const Login()));
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('User created')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(color: ksecColor),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  const Image(
                    width: 400,
                    height: 260,
                    image: AssetImage('assets/img/registration.png')),
                  const SizedBox(height: 20),
                  Text('Create your account and start saving your favorite recipes today!', style: GoogleFonts.ubuntu(fontSize: 16)),
                  const SizedBox(height: 100),
                  Container(
                    height: 535,
                    width: 500,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50))
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        Text('Create new account', style: GoogleFonts.ubuntu(fontSize: 22, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 30),
                        SizedBox(
                          width: 350,
                          child: TextFormField(
                            validator: (value){
                              if(value!.isEmpty){
                                return 'Please provide name!';
                              }
                            },
                            decoration: InputDecoration(
                            hintStyle: GoogleFonts.fredoka(),
                            hintText: 'Name',
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
                                return 'Please provide email!';
                              }
                            },
                            decoration: InputDecoration(
                            hintStyle: GoogleFonts.fredoka(),
                            hintText: 'Email',
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(40)
                            ),
                            filled: true
                          ),
                          controller: emailController
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
                        const SizedBox(height: 20),
                        SizedBox(
                          width: 350,
                          child: TextFormField(
                            validator: (value){
                              if(value != passwordController.text){
                                return 'Password dont match!';
                              }
                            },
                            decoration: InputDecoration(
                            hintStyle: GoogleFonts.fredoka(),
                            hintText: 'Password Confirmation',
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(40)
                            ),
                            filled: true
                          ),
                          controller: passwordConFController,
                          obscureText: true,
                          ),
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: (){
                            if(formKey.currentState!.validate()){
                              registerUser();
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
                              child: Text('Sign Up', style: GoogleFonts.fredoka(fontSize: 20,color: Colors.white, fontWeight: FontWeight.w600)),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            const SizedBox(width: 110),
                            Text('Already have an account?', style: GoogleFonts.fredoka(fontSize: 14)),
                            const SizedBox(width: 2),
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>const Login()));
                              },
                              child: Text('Login Now', style: GoogleFonts.fredoka(color: Colors.red,fontSize: 14, decoration: TextDecoration.underline)))
                          ],
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