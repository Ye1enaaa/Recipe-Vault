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
    print(response.reasonPhrase);
  }
  Future deleteRecipe(String id)async{
    final uri = Uri.parse('$deleteRecipeURL$id');
    final response = await http.delete(uri);
    print(response.statusCode);
  }
  Future<void> showMyDialog(BuildContext context, String id, index) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Confirm Deletion?'),
        content: SingleChildScrollView(
          child: ListBody(
            children:const  <Widget>[
              //Text('Confirm Deletion?'),
              Text('Would you like to delete this contact?'),
            ],
          ),
        ),
        actions: <Widget>[
          ElevatedButton(
            child: const Text('Yes'),
            onPressed: () async{
              setState(() {
                deleteRecipe(id);
                receiveData.removeAt(index);
              });
              Navigator.of(context).pop();
            },
          ),
          ElevatedButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: Drawer(),
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
                      width: 1,
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
                                width: 38,
                                height: 38,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: const DecorationImage(
                                    image: AssetImage('assets/img/gojo.jpg'),
                                    ),                    
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
                              const SizedBox(width: 220),
                                //add ratings here
                              Text('$ratings'),
                              const SizedBox(width: 5),
                              const Icon(LineIcons.star),
                              //const SizedBox(width: 2),
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
                  //const SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        //width: MediaQuery.of(context).size.width,
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