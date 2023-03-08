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