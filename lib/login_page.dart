import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_flutter/bloc/sign_in.dart';
import 'package:sign_in_flutter/customCard.dart';
import 'package:sign_in_flutter/sign_in_btn.dart';

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
                colors: [
              Colors.white,
              Color(0xfffff3e6),
            ])),
        child: _body(),
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:
          GoogleSignIn().currentUser == null ? SignIn() : Container(),
    );
  }

  Widget _body() {
    // final card = CustomCard.fromMap(Global.cardData[0]);
    CustomCard card = CustomCard.fromMap(Global.cardData[2]);
    CustomCard imgCard = CustomCard.fromMap(Global.cardData[1]);

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
                    TextCard(card: card),
                    SizedBox(height: 30),
                    ImgCard(card: imgCard)
                  ],
                ),
              ),
            ])));
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
                hintText: "Search Text",
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
