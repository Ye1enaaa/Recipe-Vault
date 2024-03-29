import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import '../../../constants/constants.dart';
import '../../../models/api_response.dart';
import '../../../widgets/custom_widget.dart';
import 'package:http/http.dart' as http;
class DinnerTab extends StatefulWidget {
  const DinnerTab({ Key? key }) : super(key: key);

  @override
  _DinnerTabState createState() => _DinnerTabState();
}

class _DinnerTabState extends State<DinnerTab> {
  List receiveData = <dynamic>[];
  int userId = 0;
  Future getDatA() async {
    String token = await getToken();
    userId = await getUserId();
    final headers = {
      'Content-Type': 'application/json',
      'Authorization' : 'Bearer $token'
    };
    final response = await http.get(Uri.parse('$dinnerRecipeURL$userId'), headers: headers);
    final decodeme = jsonDecode(response.body) as Map;
      final result = decodeme['dinner'] as List;
      setState(() {
        receiveData = result;
      });
  }

  Future deleteRecipe(String id)async{
    await http.delete(Uri.parse('$deleteRecipeURL$id'));
  }

  Future<void> showMyDialog(BuildContext context, String id, index) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, 
    builder: (BuildContext context) {
      return CustomAlertDialog(
        onPressed: () async{
        setState(() {
          deleteRecipe(id);
          receiveData.removeAt(index);
        });
        Navigator.of(context).pop();
      });
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
                              //const EricksonText(),
                              const SizedBox(width: 280),
                              Text('$ratings',style: GoogleFonts.fredoka(fontWeight: FontWeight.w500)),
                              const SizedBox(width: 5),
                              const Icon(LineIcons.star),
                              IconButton(
                                onPressed:(){
                                  showMyDialog(context, id, index);
                                }, 
                                icon: const Icon(LineIcons.trash),
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