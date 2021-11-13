import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_login/screens/login_screen.dart';
import 'package:flutter_social_login/service/auth_service.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () => logout(context),
                child: Icon(
                  Icons.logout,
                  size: 26.0,
                ),
              )
          ),
        ],
      ),
      body: _welcomeWidget(user),
    );
  }

  Widget _welcomeWidget(User user) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage(user.photoURL!),
              radius: 50,
            ),
            Divider(),
            Text("Name:- ${user.displayName!}"),
            Text("Email:- ${user.email!}"),
            Text("Provider:- ${user.providerData[0].providerId}"),
          ],
        ));
  }
  
  void logout(BuildContext context) async{
    AuthService().signOut();
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}
