import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                  var steps = item['steps'];
                  var imageValue = item['img'];
              return Container(
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
                                  
                                ),
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                'Erickson',
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 18.0
                                ),
                                )
                            ],
                          ), 
                        )
                      ],
                    ),
                  const SizedBox(height: 12),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 180,
                    margin: const EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('$getImageURL$imageValue'),
                        fit: BoxFit.cover
                      )
                    ),
                  )
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