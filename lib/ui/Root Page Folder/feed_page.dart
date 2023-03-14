import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import '../../constants/constants.dart';
import '../../widgets/custom_widget.dart';
import 'package:http/http.dart' as http;
class FeedPage extends StatefulWidget {
  const FeedPage({ Key? key }) : super(key: key);

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  List receiver = <dynamic>[];
  Future getDatA() async{
    final response = await http.get(Uri.parse(getRecipeURL));
    final decodeThis = jsonDecode(response.body) as Map;
    final decoded = decodeThis['recipes'] as List;
    setState(() {
      receiver = decoded;
    });
  print(response.body);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white10,
        title: Text(
          "Homepage",
          style: GoogleFonts.ubuntu(
            fontSize: 22, fontWeight: FontWeight.w500,
            color: Colors.black
          )
        )
      ),
      body: SafeArea(
        child: RefreshIndicator(
          backgroundColor: kprimaryColor,
          onRefresh: getDatA,
            child: ListView.builder(
              itemCount: receiver.length,
              itemBuilder: (BuildContext context, index){
              final item = receiver[index] as Map;
              final id = item['id'].toString();
              var cuisineName = item['cuisine'];
              var ingredientsName = item['ingredients'];
              var ratings = item['ratings'];
              var imageValue = item['img'];
              var tentativeVal = item['user'] as Map;
              var name = tentativeVal['name'];
              return Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                    width: 0.4,
                    color: Colors.grey
                    )
                  )),
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: Row(
                            children: [
                              const CustomListingAvatar(),
                              const SizedBox(width: 10),
                              Text(
                                '$name',
                                style: GoogleFonts.fredoka(
                                fontWeight: FontWeight.w400,
                                fontSize: 18
                                )
                              )
                            ]
                          ) 
                        )
                      ]
                      ),
                    Row(
                      children: [
                        CustomImageWidget(image: DecorationImage(
                          image: NetworkImage('$getImageURL$imageValue'),
                          fit: BoxFit.cover
                        )),
                        const SizedBox(width: 20),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('$cuisineName', style: GoogleFonts.akayaKanadaka(textStyle: style)),
                            const SizedBox(height: 25),
                            Text('Ingredients:',style: GoogleFonts.fredoka(fontSize: 17)),
                            const SizedBox(height: 6),
                            Text('$ingredientsName', style: GoogleFonts.dancingScript(textStyle: secstyle))
                          ]
                        )
                      ]
                    ),
                  const SizedBox(height: 10)
                  ]
                )
              );
            }
          ) 
        )
      )
    );
  }
}