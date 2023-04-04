import 'package:flutter/material.dart';
import 'package:login_biometrico/pages/widgets/custom_btn.dart';

import '../../locator.dart';
import '../../services/camera.service.dart';
import '../models/user.model.dart';
import '../profile.dart';
import 'app_text_field.dart';

class SignInSheet extends StatelessWidget {
  SignInSheet({Key? key, required this.user}) : super(key: key);
  final User user;

  final _passwordController = TextEditingController();
  final _cameraService = locator<CameraService>();

  Future _signIn(context, user) async {
    if (user.password == _passwordController.text) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => Profile(
                    user.user,
                    imagePath: _cameraService.imagePath!,
                  )));
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            content: Text('Wrong password!'),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text(
              'Welcome back, ' + user.user + '.',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 10),
              AppTextField(
                controller: _passwordController,
                labelText: "Password",
                isPassword: true,
              ),
              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(height: 10),
              CustomButton(
                  context: context,
                  backgroundColor: Color(0xFF0F0BDB),
                  tintColor: Colors.white,
                  text: 'LOGIN',
                  icon: Icons.login,
                  onTap: () {
                    _signIn(context, user);
                  })
            ],
          ),
        ],
      ),
    );
  }
}
