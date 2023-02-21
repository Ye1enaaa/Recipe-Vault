import 'package:firstactivity/ui/root_page.dart';
import 'package:firstactivity/constants/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50),
              const Icon(
                LineIcons.lock,
                size: 100,
              ),
              Text(
                'A safe space for your secret recipe',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 18
                )
              ),
              const SizedBox(height: 20),
              TextFields(
                maxLines: null,
                controller: nameController, 
                obscureText: false, 
                hintText: 'Username'),
              const SizedBox(height: 20),
              TextFields(
                maxLines: null,
                controller: passwordController, 
                obscureText: true, 
                hintText: 'Password'),
              const SizedBox(height: 20),
              Container(
                width: 350,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: Colors.white
                ),
                child: const Text(
                  'SUBMIT',
                  style: TextStyle(
                    fontSize: 49,
                    fontFamily: 'Lato'
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 10),
              const Text('or')
            ]
          ),
        )),
    );
  }
}