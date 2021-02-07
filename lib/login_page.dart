import 'package:flutter/material.dart';
import 'package:sign_in_flutter/bloc/sign_in.dart';

import 'first_screen.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.white, Colors.lightBlue.shade100])),
      child: _body(),
    )));
  }

  Widget _body() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 50),
          _signInButton(),
        ],
      ),
    );
  }

  Widget _signInButton() {
    return GestureDetector(
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
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

              trailing: Icon(Icons.keyboard_arrow_right,
                  color: Colors.black, size: 30.0)),
        ),
      ),
      onTap: () {
        signInWithGoogle().then((result) {
          if (result != null) {
            final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
            pattern
                .allMatches(result)
                .forEach((match) => print(match.group(0)));

            //      eyJhbGciOiJSUzI1NiIsImtpZCI6IjAzYjJkMjJjMmZlY2Y4NzNlZDE5ZTViOGNmNzA0YWZiN2UyZWQ0YmUiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2FjY291bnRzLmdvb2dsZS5jb20iLCJhenAiOiI5MDE5NjUyMTU3MjAtdGRqb3ZtczZtN3VjcmE0dmlhNHZzZHIzZjNvanZxY2QuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJhdWQiOiI5MDE5NjUyMTU3MjAtdGRqb3ZtczZtN3VjcmE0dmlhNHZzZHIzZjNvanZxY2QuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJzdWIiOiIxMTEyODY3Njk4NjE0ODYyMzI5MDEiLCJlbWFpbCI6Im51dGhzYWlkNUBnbWFpbC5jb20iLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwiYXRfaGFzaCI6InJBY2l2NENHSXhWdjZIQU9UQXN3SXciLCJub25jZSI6IlU0d1VHYXVrUlp1RVRuWWVvc2ptdDN1blpOQ0Nya3RqQmJYWUN6a2U4bkUiLCJuYW1lIjoiSmFzb24gRWRkeSIsInBpY3R1cmUiOiJodHRwczovL2xoMy5nb29nbGV1c2VyY29udGVudC5jb20vYS0vQU9oMTRHaTN2VlBEaEJ0QjRKVElIMFF2WWJuQnQ4ejRMWTBWQk1kZXk3YUo9czk2LWMiLCJnaXZlbl9uYW1lIjoiSmFzb24iLCJmYW1pbHlfbmFtZSI6IkVkZHkiLCJsb2NhbGUiOiJlbi1HQiIsImlhdCI6MTYxMjY0NDgyMCwiZXhwIjoxNjEyNjQ4NDIwfQ.UojdMFKrpmKhHsGhumr0MdN414u_fbemqz70-pcgazBiTvWAC-vcBNkIlV1bvmSR_tHOih9PW3RHiMmgC3s90Q4-rxtftn71jDMpwR5NAvL8O_9rlc1S-hsJo5tA_zQJ3vvEVH4DID-TMcSOqVsTvKiq8W3F-QNaF2lYu2o7ym1O9PyfHA92u_reEz9L-obnCvV6cq7uhtxpyQWXBYh03ELBc-3khFuNMWy6eOu-W-OV1ug-ecwct6V6KtiQrXqiw-D_DM-A56Gcl3Rtwt3ZDxs_x1x85m4Gxwhbklvu2cqOaHmvmfwIvzVIOsAUNF2gMWC5A_s-CmTAGL9KYMFLBg
            /*
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return FirstScreen();
                },
              ),
            );
            */
          }
        });
      },
    );
  }
}
