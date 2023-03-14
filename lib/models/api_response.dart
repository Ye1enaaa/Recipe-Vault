import 'package:shared_preferences/shared_preferences.dart';

class ApiResponse{
  Object? data;
  String? error;
}

class User{
  int? id;
  String? name;
  String? email;
  String? token;

  User({
    this.id,
    this.name,
    this.email,
    this.token,
});

  //convert json data to user model
  factory User.fromJson(Map<String,dynamic> json){
    return User(
      id: json['user']['id'],
      name: json['user']['name'],
      email: json['user']['email'],
      token: json['token']
    );
  }
}

Future<String> getToken() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString('token') ?? '';
}

Future<int> getUserId() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getInt('userId') ?? 0;
}

Future<bool> logout() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return await pref.remove('token');
}