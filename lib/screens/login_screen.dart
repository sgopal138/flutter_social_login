import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_social_login/screens/home_screen.dart';
import 'package:flutter_social_login/service/auth_service.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Social Auth Login"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: _loginWidget(context),
    );
  }

  Widget _loginWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SignInButton(
            Buttons.Google,
            onPressed: () {
              AuthService().signInWithGoogle().then((value) {
                launchHomeScreen(context);
              });
            },
          ),
          Divider(),
          SignInButton(
            Buttons.FacebookNew,
            onPressed: () {
              AuthService().signInWithFacebook().then((value) {
               launchHomeScreen(context);
              });
            },
          ),
        ],
      ),
    );
  }

  launchHomeScreen(BuildContext context){
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => HomeScreen()));
  }
}
