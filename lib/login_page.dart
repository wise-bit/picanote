import 'package:flutter/material.dart';
import 'package:sign_in_flutter/bloc/sign_in.dart';
import 'package:sign_in_flutter/sign_in_btn.dart';

import 'first_screen.dart';
import 'global.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController textEditingController = new TextEditingController();
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
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SignIn(),
    );
  }

  Widget _body() {
    return Padding(
      padding: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 50),
            _searchBar(),
            Expanded(
              child: ListView(
                children: [
                  Text(
                    "Date",
                    style: TextStyle(
                        color: Colors.black, fontFamily: 'Sf', fontSize: 15.0),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _searchBar() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.black38.withAlpha(10),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: textEditingController,
              decoration: InputDecoration(
                hintText: "Search Flutter Topic",
                hintStyle: TextStyle(
                  color: Colors.black.withAlpha(120),
                ),
                border: InputBorder.none,
              ),
              onChanged: (String keyword) {},
            ),
          ),
          Icon(
            Icons.search,
            color: Colors.black.withAlpha(120),
          )
        ],
      ),
    );
  }
}
