import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:share/share.dart';
import 'package:sign_in_flutter/bloc/sign_in.dart';
import 'package:sign_in_flutter/customCard.dart';
import 'bloc/picture.dart';
import 'bloc/api.dart';
import 'global.dart';

class SharePlay extends StatefulWidget {
  @override
  _SharePlayState createState() => _SharePlayState();
}

class _SharePlayState extends State<SharePlay> {
  TextEditingController textEditingController = new TextEditingController();
  List<Picture> result = [];
  User user;
  String nanoId = "";
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
      floatingActionButtonLocation: user == null
          ? FloatingActionButtonLocation.centerDocked
          : FloatingActionButtonLocation.startFloat,
      floatingActionButton: user == null ? _signInBtn() : _nanoPart(),
    );
  }

  //nanoId

  Widget _body() {
    // final card = CustomCard.fromMap(Global.cardData[0]);

    return Padding(
        padding: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: Center(
            child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
              SizedBox(height: 50),
              user == null
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(user.photoURL),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
              _searchBar(),
              SizedBox(height: 10),
              _list(),
            ])));
  }

  Widget _list() {
    if (result.length == 0) {
      return Container();
    } else {
      List<Picture> found = [];

      for (Picture e in result) {
        if (e.info.toLowerCase().contains(textEditingController.text))
          found.add(e);
      }

      print(found.length);
      for (int i = 0; i < found.length; i++) {
        print(textEditingController.text);

        print(found[i].imageurl);
      }
      // data =
      return Expanded(
        child: ListView.builder(
          itemCount: found.length,
          itemBuilder: (builder, i) {
            CustomCard textCard = CustomCard.fromMap({
              'color': Global.white,
              'backGroundColor': Global.orange,
              'icon': Icons.lock_outline,
              'title': found[i].info,
            });

            CustomCard imgCard = CustomCard.fromMap(
              {
                'color': Global.white,
                'backGroundColor': Global.lightBlue,
                'icon': Icons.videocam,
                'title': found[i].imageurl,
                'headline': 'Remote camera configuration',
                'buttonTitle': 'View Cameras',
              },
            );

            return Column(
              children: [
                SizedBox(height: 30),
                found[i].info.length > 0
                    ? TextCard(card: textCard)
                    : Container(),
                found[i].imageurl.length > 0
                    ? ImgCard(card: imgCard)
                    : Container()
              ],
            );
            ;
          },
        ),
      );
    }
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
              onChanged: (String keyword) {
                setState(() {});
              },
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

  Widget _signInBtn() {
    return Align(
        alignment: Alignment.bottomLeft,
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
                            right: new BorderSide(
                                width: 1.0, color: Colors.black))),
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
            user = await signInWithGoogle();
            await API.postNewUser(await user.getIdToken());
            result = await API.getInfo(await user.getIdToken());
            nanoId = await API.getNanoId(await user.getIdToken());

            setState(() {});
          },
        ));
  }

  Widget _nanoPart() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Card(
        elevation: 12.0,
        margin: new EdgeInsets.only(left: 200, top: 1.0),
        child: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: ListTile(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right: new BorderSide(width: 1.0, color: Colors.black))),
              child: IconButton(
                icon: Icon(Icons.airplay_rounded, color: Colors.black),
                onPressed: () {
                  print("???");
                  Share.share('$nanoId', subject: "Here is your nanoId!");
                },
              ),
            ),
            title: Text("$nanoId",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
            // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}

/*

*/
