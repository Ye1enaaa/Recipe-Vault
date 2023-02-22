import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:line_icons/line_icons.dart';
import '../constants/constants.dart';

class Listings extends StatefulWidget {
  const Listings({ Key? key }) : super(key: key);

  @override
  _ListingsState createState() => _ListingsState();
}

class _ListingsState extends State<Listings> {
  List receiveData = <dynamic>[];
  Future<void> getDatA() async {
    final uri = Uri.parse(getRecipeURL);
    final response = await http.get(uri);
    
    if (response.statusCode == 200) {
      final decodeme = jsonDecode(response.body) as Map;
      final result = decodeme['recipes'] as List;
      setState(() {
        receiveData = result;
      });
    }
  }
  Future deleteRecipe(String id)async{
    final uri = Uri.parse('$deleteRecipeURL$id');
    await http.delete(uri);
  }
  Future<void> showMyDialog(BuildContext context, String id, index) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, 
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Confirm Deletion?',
          style: GoogleFonts.fredoka(),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children:<Widget>[
              Text(
                'Would you like to delete this recipe?',
                style: GoogleFonts.fredoka(),
                )
            ]
          )
        ),
        actions: <Widget>[
          OutlinedButton(
            onPressed: () async{
              setState(() {
                deleteRecipe(id);
                receiveData.removeAt(index);
              });
              Navigator.of(context).pop();
            },
            style: OutlinedButton.styleFrom(
              backgroundColor: ksecColor
            ),
            child: Text(
              'Yes',
              style: GoogleFonts.fredoka(
                color: Colors.black,
                fontWeight: FontWeight.w400
              ),
            ),
          ),
          OutlinedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: OutlinedButton.styleFrom(
              backgroundColor: ksecColor
            ),
            child: Text(
              'No',
              style: GoogleFonts.fredoka(
                color: Colors.black,
                fontWeight: FontWeight.w400
              ),
            )
          )
        ]
      );
    }
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          backgroundColor: kprimaryColor,
          onRefresh: getDatA,
          child: ListView.builder(
            itemCount: receiveData.length,
            itemBuilder: (BuildContext context, index){
            final item = receiveData[index] as Map;
                  final id = item['id'].toString();
                  var cuisineName = item['cuisine'];
                  var ingredientsName = item['ingredients'];
                  var ratings = item['ratings'];
                  var imageValue = item['img'];
              return Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 0.4,
                      color: Colors.grey
                    ))
                ),
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
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: const DecorationImage(
                                    image: AssetImage('assets/img/erickson.jpg'),
                                    )
                                )
                              ),
                              const SizedBox(width: 10),
                              Text(
                                'Erickson',
                                style: GoogleFonts.fredoka(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18
                                )
                                ),
                              const SizedBox(width: 225),
                              Text(
                                '$ratings',
                                style: GoogleFonts.fredoka(
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                              const SizedBox(width: 5),
                              const Icon(LineIcons.star),
                              IconButton(
                                onPressed:(){
                                  showMyDialog(context, id, index);
                                }, 
                                icon: const Icon(LineIcons.trash),
                                )
                            ],
                          ), 
                        )
                      ],
                    ),
                  Row(
                    children: [
                      Container(
                        width: 180,
                        height: 180,
                        margin: const EdgeInsets.only(top: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          image: DecorationImage(
                            image: NetworkImage('$getImageURL$imageValue'),
                            fit: BoxFit.cover
                          )
                        ),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '$cuisineName',
                            style: GoogleFonts.akayaKanadaka(
                              textStyle: style
                            )
                          ),
                          const SizedBox(height: 25),
                          Text(
                            'Ingredients:',
                            style: GoogleFonts.fredoka(
                              fontSize: 17
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            '$ingredientsName',
                            style: GoogleFonts.dancingScript(
                              textStyle: secstyle
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 10)
                  ],
                ),
              );
            }
            ), 
          ),
      ),
    ); 
  }
}