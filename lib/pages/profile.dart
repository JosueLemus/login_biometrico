import 'dart:io';
import 'package:flutter/material.dart';
import 'package:login_biometrico/pages/widgets/app_button.dart';
import 'home.dart';

class Profile extends StatelessWidget {
  const Profile(this.username, {Key? key, required this.imagePath})
      : super(key: key);
  final String username;
  final String imagePath;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: FileImage(File(imagePath)),
                    ),
                  ),
                  margin: EdgeInsets.all(20),
                  width: 50,
                  height: 50,
                ),
                Text(
                  'Hola ' + username + '!',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            
            AppButton(
              text: "CERRAR SESION",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                );
              },
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ),
              color: Color(0xFFFF6161),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
