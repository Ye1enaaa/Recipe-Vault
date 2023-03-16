import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import '../../widgets/custom_widget.dart';
import '../../models/api_response.dart';
import '../Login & Register Page/login.dart';
class ProfilePage extends StatefulWidget {
  const ProfilePage({ Key? key }) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User user = User();

  @override
  void initState() {
    getUserDetails();
    super.initState();
  }
  
  Future? getUserDetails()async{
    ApiResponse responses = await getUserDetail();
    if(responses.data != null){
      user = responses.data as User;
    }
    print('hi');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              Text(
                'My Profile',
                style: GoogleFonts.fredokaOne(
                  fontWeight: FontWeight.w100,
                  fontSize: 40,
                )
              ),
              const SizedBox(height: 30),
              Center(
                child: Container( 
                  height:200,
                  width: 200,
                decoration: BoxDecoration(
                  border: Border.all(width: 2),
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 2,
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.1)
                    )
                  ],
                  shape: BoxShape.circle,
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/img/avatarprd.png')
                  )
                )
                )
              ),
              const SizedBox(height: 15),
              Text(
                'User',
                style: GoogleFonts.fredoka(
                  fontSize: 24
                )
              ),
              const SizedBox(height: 5),
              Text(
                '2020301583',
                style: GoogleFonts.fredoka()
              ),
              const SizedBox(height: 40),
              Column(
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 30),
                        const Icon(LineIcons.user),
                        const SizedBox(width: 30),
                        Text(
                          'User',
                          style: GoogleFonts.fredoka(
                            fontSize: 18,
                          )
                        )
                      ]
                    ),
                    const SizedBox(height: 30),
                    GestureDetector(
                      onTap: getUserDetails,
                      child: Row(
                        children: [
                          const SizedBox(width: 30),
                          const Icon(LineIcons.birthdayCake),
                          const SizedBox(width: 30),
                          Text(
                            'November 1, 2001',
                            style: GoogleFonts.fredoka(
                              fontSize: 18,
                            )
                          )
                        ]
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        const SizedBox(width: 30),
                        const Icon(LineIcons.phone),
                        const SizedBox(width: 30),
                        Text(
                          '09659065840',
                          style: GoogleFonts.fredoka(
                            fontSize: 18,
                          )
                        )
                      ]
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        const SizedBox(width: 30),
                        const Icon(LineIcons.facebook),
                        const SizedBox(width: 30),
                        Text(
                          'https://web.facebook.com/EADC.04',
                          style: GoogleFonts.fredoka(
                            fontSize: 18,
                          )
                        )
                      ]
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        const SizedBox(width: 30),
                        const Icon(LineIcons.twitter),
                        const SizedBox(width: 30),
                        Text(
                          'https://twitter.com/Erickson_101',
                          style: GoogleFonts.fredoka(
                            fontSize: 18,
                          )
                        )
                      ]
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        const SizedBox(width: 30),
                        const Icon(LineIcons.instagram),
                        const SizedBox(width: 30),
                        Text(
                          'https://www.instagram.com/erick.son101',
                          style: GoogleFonts.fredoka(
                            fontSize: 18,
                          )
                        )
                      ]
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        const SizedBox(width: 30),
                        const Icon(LineIcons.envelope),
                        const SizedBox(width: 30),
                        Text(
                          'avilasonson@gmail.com',
                          style: GoogleFonts.fredoka(
                            fontSize: 18,
                          )
                        )
                      ]
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        const SizedBox(width: 30),
                        const Icon(LineIcons.github),
                        const SizedBox(width: 30),
                        Text(
                          'https://github.com/Ye1enaaa',
                          style: GoogleFonts.fredoka(
                            fontSize: 18,
                          )
                        )
                      ]
                    ),
                    const SizedBox(height: 30),
                    GestureDetector(
                      onTap: (){
                        logout().then((value){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const Login()));
                        });
                      },
                      child: Row(
                        children: [
                          const SizedBox(width: 30),
                          const Icon(LineIcons.removeUser),
                          const SizedBox(width: 30),
                          Text(
                            'Log Out',
                            style: GoogleFonts.fredoka(
                              fontSize: 18,
                            )
                          )
                        ]
                      ),
                    )
                ]
              ),
            ]
          )
        )
      ),
    );
  }
}