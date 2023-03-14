import 'dart:convert';

import 'package:firstactivity/constants/constants.dart';
import 'package:firstactivity/ui/Login%20&%20Register%20Page/admin%20login/user_index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import '../../../models/api_response.dart';

class Admin extends StatefulWidget {
  const Admin({ Key? key }) : super(key: key);

  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<ApiResponse> login (String email, String password)async{
  ApiResponse apIresponse = ApiResponse();

  try{
    final response = await http.post(
    Uri.parse(adminURL),
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
    ApiResponse response = await login(emailController.text, passwordController.text);
    if(response.error == null){
      // ignore: use_build_context_synchronously
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const UserIndex()));
    }
    else{
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Incorrect Details')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Container(
          width: 500,
            decoration: const BoxDecoration(color: ksecColor),
            child: Column(
              children: [
                const SizedBox(height: 250),
                Text('Admin', style: GoogleFonts.ubuntu(fontSize: 16)),
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
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.zero)
                    ),
                    filled: true
                  ),
                  controller: emailController,
                  )
                ),
                const SizedBox(height: 30),
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
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.zero)
                    ),
                    filled: true
                  ),
                  controller: passwordController,
                  obscureText: true,
                  )
                ),
                const SizedBox(height: 40),
                GestureDetector(
                  onTap: (){
                    loginNow();
                  },
                  child: Container(
                    height: 60,
                    width: 230,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.zero),
                      color: Colors.black45
                    ),
                    child: Center(
                      child: Text('Log In', style: GoogleFonts.fredoka(fontSize: 20,color: Colors.black, fontWeight: FontWeight.w600)),
                    ),
                  ),
                ),
              ],
            ),
          ),
      ),
      
    );
  }
}