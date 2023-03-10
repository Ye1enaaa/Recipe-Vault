import 'dart:convert';
import 'package:firstactivity/constants/constants.dart';
import 'package:firstactivity/ui/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:line_icons/line_icons.dart';
class UserIndex extends StatefulWidget {
  const UserIndex({ Key? key }) : super(key: key);

  @override
  _UserIndexState createState() => _UserIndexState();
}

class _UserIndexState extends State<UserIndex> {
  List receiver = <dynamic>[];
  Future<void> getData() async {
    final uri = Uri.parse(usersURL);
    final response = await http.get(uri);
    
    if (response.statusCode == 200) {
      final decode = jsonDecode(response.body) as Map;
      final result = decode['users'] as List;
      setState(() {
        receiver = result;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ksecColor,
        title: const Text('User Details'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const Login()));
          }, icon: const Icon(LineIcons.doorOpen))
        ],
      ),
      body: RefreshIndicator(
        onRefresh: getData,
        child: ListView.builder(
          itemCount: receiver.length,
          itemBuilder: (context,index){
            final item = receiver[index] as Map;
            final id = item['id'].toString();
            var name = item['name'];
            var email = item['email'];
            return Container(
              decoration: const BoxDecoration(border: Border(bottom: BorderSide(width: 0.2))),
              child: ListTile(
                title: Text('Name: $name' , style: GoogleFonts.ubuntu()),
                subtitle:Text('Email: $email', style: GoogleFonts.ubuntu()) ,
                trailing: const Icon(LineIcons.userSecret , color: Colors.black,),
              ),
            );
          },
        ),
      ),
    );
  }
}