// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

const baseURL = 'http://192.168.22.139:8000';
const postRecipeURL = '$baseURL/api/recipe';
const getRecipeURL = '$baseURL/api/recipe';
const getImageURL = '$baseURL/storage/app/images/';
const deleteRecipeURL = '$baseURL/api/recipe/';
const breakfastRecipeURL = '$baseURL/api/filter/Breakfast';
const lunchRecipeURL = '$baseURL/api/filter/Lunch';
const dinnerRecipeURL = '$baseURL/api/filter/Dinner';
const loginURL = '$baseURL/api/login';

//https://www.color-hex.com/color-palettes/
//const 0xFF
//https://www.figma.com/file/FKbiRsNMjb87dH2td438zj/foodini-2.0?node-id=2%3A276&t=IbJupUfPMvfBuNHP-0
const kprimaryColor = Color(0xFF000000);
const ksecColor = Color(0xFF3FC979);
final style = TextStyle(fontSize: 30, fontWeight: FontWeight.w400, color: ksecColor);
final secstyle = TextStyle(fontSize: 19, fontWeight: FontWeight.w200);
