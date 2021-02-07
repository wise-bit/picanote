import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sign_in_flutter/bloc/api.dart';
import 'package:sign_in_flutter/bloc/sign_in.dart';

class SignIn extends StatefulWidget {
  SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        child: Card(
          elevation: 12.0,
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
            decoration: BoxDecoration(color: Colors.white),
            child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                leading: Container(
                  padding: EdgeInsets.only(right: 12.0),
                  decoration: new BoxDecoration(
                      border: new Border(
                          right:
                              new BorderSide(width: 1.0, color: Colors.black))),
                  child: Icon(Icons.person, color: Colors.black),
                ),
                title: Text(
                  "Login with Gmail",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                trailing: Icon(Icons.keyboard_arrow_right,
                    color: Colors.black, size: 30.0)),
          ),
        ),
        onTap: () async {
          User user = await signInWithGoogle();
          await API.postNewUser(user.refreshToken);
          setState(() {});
        },
      ),
    );
  }
}
