import 'dart:convert';
import 'package:firstactivity/constants/constants.dart';
import 'package:firstactivity/models/api_response.dart';
import 'package:firstactivity/ui/Login%20&%20Register%20Page/admin%20login/admin.dart';
import 'package:firstactivity/ui/Login%20&%20Register%20Page/register.dart';
import 'package:firstactivity/ui/Root%20Page%20Folder/root_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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
      saveToken(response.data as User);
      getUserDetail();
    }
    else{
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Incorrect Details')));
    }
  }

  void saveToken(User user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('token', user.token ?? '');
    await pref.setInt('userId', user.id ?? 0);
    // ignore: use_build_context_synchronously
    Navigator.push(context, MaterialPageRoute(builder: (context)=>const RootPage()));
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
                  const Image(
                    width: 400,
                    height: 250,
                    image: AssetImage('assets/img/userlogin.png')),
                  const SizedBox(height: 20),
                  Text('Keep track of your culinary creations with ease using Recipe Vault.', style: GoogleFonts.ubuntu(fontSize: 16)),
                  Text('From savory to sweet, never forget a recipe again.', style: GoogleFonts.ubuntu(fontSize: 16)),
                  const SizedBox(height: 100),
                  Container(
                    height: 460,
                    width: 500,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50))
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        Text('Login to your account', style: GoogleFonts.ubuntu(fontSize: 22, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 30),
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
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const SizedBox(width: 250),
                            Text('No Account?', style: GoogleFonts.fredoka(fontSize: 12)),
                            const SizedBox(width: 1),
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>const Register()));
                              },
                              child: Text('Register here', 
                                style: GoogleFonts.fredoka(color: ksecColor,fontSize: 12,decoration: TextDecoration.underline)
                              ))
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
                        ),
                        const SizedBox(height: 15),
                        Text('or', style: GoogleFonts.fredoka(fontSize: 15)),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            const SizedBox(width: 110),
                            Text('Are you an administrator?', style: GoogleFonts.fredoka(fontSize: 14)),
                            const SizedBox(width: 2),
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>const Admin()));
                              },
                              child: Text('Click here', style: GoogleFonts.fredoka(color: Colors.red,fontSize: 14, decoration: TextDecoration.underline)))
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