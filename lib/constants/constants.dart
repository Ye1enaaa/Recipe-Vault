// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

const baseURL = 'http://192.168.85.116:8000';
const postRecipeURL = '$baseURL/api/recipe';
const getRecipeURL = '$baseURL/api/recipe';
const getImageURL = '$baseURL/storage/' ;
const deleteRecipeURL = '$baseURL/api/recipe/';

//https://www.color-hex.com/color-palettes/
//const 0xFF
//https://www.figma.com/file/FKbiRsNMjb87dH2td438zj/foodini-2.0?node-id=2%3A276&t=IbJupUfPMvfBuNHP-0
const kprimaryColor = Color(0xFF000000);
const ksecColor = Color(0xFF3FC979);
final style = TextStyle(fontSize: 40, fontWeight: FontWeight.w400);
final secstyle = TextStyle(fontSize: 25, fontWeight: FontWeight.w200);