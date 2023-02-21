import 'package:flutter/material.dart';

class TextFields extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final maxLines;
  final hintStyle;
const TextFields({ 
  Key? key,
  required this.hintStyle,
  required this.maxLines,
  required this.controller,
  required this.hintText,
  required this.obscureText
 }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
        child: TextField(
        maxLines: maxLines,
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(   
          hintStyle: hintStyle,
          hintText: hintText,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white)
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400)
          ),
          filled: true
        ),
      ),
    );
  }
}