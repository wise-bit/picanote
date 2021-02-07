import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sign_in_flutter/global.dart';

class TextCard extends StatelessWidget {
  final CustomCard card;

  const TextCard({this.card});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40.0),
            boxShadow: [
              BoxShadow(
                color: card.backGroundColor.withOpacity(0.25),
                blurRadius: 40.0,
                spreadRadius: 0.0,
              )
            ],
            color: card.backGroundColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(Icons.format_quote, color: Global.white, size: 40.0),
                Row(
                  children: <Widget>[
                    SizedBox(width: 10.0),
                    Expanded(
                      child: Padding(
                        padding: new EdgeInsets.only(left: 30.0),
                        child: Text(
                          " card.title titletitletitletitletitle ",
                          style: TextStyle(color: Global.white, fontSize: 15),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ImgCard extends StatelessWidget {
  final CustomCard card;

  const ImgCard({this.card});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40.0),
            boxShadow: [
              BoxShadow(
                color: card.backGroundColor.withOpacity(0.25),
                blurRadius: 40.0,
                spreadRadius: 0.0,
              )
            ],
            color: card.backGroundColor,
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 30, top: 30, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(Icons.image, color: Colors.black, size: 40.0),
                Row(
                  children: <Widget>[
                    SizedBox(width: 35.0),
                    Container(
                      height: 300,
                      width: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                        color: const Color(0xff7c94b6),
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://upload.wikimedia.org/wikipedia/commons/2/2c/Ice-Cube_2014-01-09-Chicago-photoby-Adam-Bielawski.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*
 Container(
                width: 150,
                height: 44,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Global.white,
                ),
                child: Center(
                  child: Text(
                    card.buttonTitle,
                    style: TextStyle(
                        color: card.backGroundColor,
                        fontFamily: 'Sf',
                        fontSize: 13.0),
                  ),
                ),
              )
*/
class CustomCard {
  final Color color;
  final Color backGroundColor;
  final IconData icon;
  final String title;
  final String headline;
  final String buttonTitle;

  CustomCard.fromMap(data)
      : color = data['color'],
        backGroundColor = data['backGroundColor'],
        icon = data['icon'],
        title = data['title'],
        headline = data['headline'],
        buttonTitle = data['buttonTitle'];
}
