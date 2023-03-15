// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

const baseURL = 'http://192.168.99.201:8000';
const postRecipeURL = '$baseURL/api/recipe';
const storeFeedRecipeURL = '$baseURL/api/feed';
const storeAllRecipeURL = '$baseURL/api/recipes';
const getFeedRecipeURL = '$baseURL/api/feed';
const getRecipeURL = '$baseURL/api/recipe';
const getImageURL = '$baseURL/storage/app/images/';
const deleteRecipeURL = '$baseURL/api/recipe/';
const breakfastRecipeURL = '$baseURL/api/brkfst/';
const lunchRecipeURL = '$baseURL/api/lunch/';
const dinnerRecipeURL = '$baseURL/api/dinner/';
const loginURL = '$baseURL/api/login';
const registerURL = '$baseURL/api/register';
const adminURL = '$baseURL/api/loginadmin';
const usersURL = '$baseURL/api/users';

//https://www.color-hex.com/color-palettes/
//const 0xFF
//https://www.figma.com/file/FKbiRsNMjb87dH2td438zj/foodini-2.0?node-id=2%3A276&t=IbJupUfPMvfBuNHP-0
const kprimaryColor = Color(0xFF000000);
const ksecColor = Color(0xFF3FC979);
final style = TextStyle(fontSize: 30, fontWeight: FontWeight.w400, color: ksecColor);
final secstyle = TextStyle(fontSize: 19, fontWeight: FontWeight.w200);
