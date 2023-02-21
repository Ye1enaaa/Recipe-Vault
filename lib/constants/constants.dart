import 'package:flutter/material.dart';

const baseURL = 'http://192.168.146.201:8000';
const postRecipeURL = '$baseURL/api/recipe';
const getRecipeURL = '$baseURL/api/recipe';
const getImageURL = '$baseURL/storage/' ;
const deleteRecipeURL = '$baseURL/api/recipe/';

//https://www.color-hex.com/color-palettes/
//const 0xFF

const kprimaryColor = Color(0xFF000000);
const ksecColor = Color(0xFF1A4D2E);
final style = TextStyle(fontSize: 60, fontWeight: FontWeight.w400);
final secstyle = TextStyle(fontSize: 30, fontWeight: FontWeight.w200);